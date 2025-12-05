import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/features/restaurant/services/restaurant_service.dart';
import 'package:catering_flutter/features/user/services/user_service.dart';
import 'package:catering_flutter/graphql/users.graphql.dart';
import 'package:catering_flutter/core/auth_service.dart';
import 'package:catering_flutter/core/widgets/custom_cached_image.dart';
import 'package:catering_flutter/features/restaurant/services/restaurant_category_service.dart';

class RestaurantFormScreen extends StatefulWidget {
  final String? restaurantIri;

  const RestaurantFormScreen({super.key, this.restaurantIri});

  @override
  State<RestaurantFormScreen> createState() => _RestaurantFormScreenState();
}

class _RestaurantFormScreenState extends State<RestaurantFormScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final authService = context.read<AuthService>();
      final userService = context.read<UserService>();
      final restaurantService = context.read<RestaurantService>();
      final categoryService = context.read<RestaurantCategoryService>();

      if (widget.restaurantIri != null) {
        restaurantService.getRestaurantById(widget.restaurantIri!);
      } else {
        restaurantService.clearCurrentRestaurant();
      }

      // Fetch categories for selection
      categoryService.getRestaurantCategories();

      if (authService.hasRole("ROLE_ADMIN")) {
        userService.fetchRestaurantOwners();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isCreateMode = widget.restaurantIri == null;
    return CustomScaffold(
      title: isCreateMode ? 'Create Restaurant' : 'Edit Details',
      child: Consumer<RestaurantService>(
        builder: (context, restaurantService, child) {
          if (restaurantService.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (restaurantService.hasError) {
            return Center(child: Text(restaurantService.errorMessage!));
          } else if (!isCreateMode &&
              restaurantService.currentRestaurant == null) {
            return const Center(child: Text('No restaurant data.'));
          }

          // Use GraphQL type directly
          final restaurant = restaurantService.currentRestaurant;

          return RestaurantForm(
            restaurant: restaurant,
            isCreateMode: isCreateMode,
          );
        },
      ),
    );
  }
}

/// Enum to represent owner selection mode
enum OwnerMode { existing, createNew }

class RestaurantForm extends StatefulWidget {
  final dynamic restaurant; // GraphQL type
  final bool isCreateMode;

  const RestaurantForm({
    super.key,
    this.restaurant,
    required this.isCreateMode,
  });

  @override
  State<RestaurantForm> createState() => _RestaurantFormState();
}

class _RestaurantFormState extends State<RestaurantForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  final ImagePicker _picker = ImagePicker();
  Query$GetUsers$users$edges$node? _selectedOwner;
  XFile? _imageFile;
  List<RestaurantCategory> _selectedCategories = [];

  // New owner creation fields
  OwnerMode _ownerMode = OwnerMode.existing;
  final TextEditingController _newOwnerEmailController =
      TextEditingController();
  final TextEditingController _newOwnerPasswordController =
      TextEditingController();
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: widget.restaurant?.name ?? '',
    );
    _descriptionController = TextEditingController(
      text: widget.restaurant?.description ?? '',
    );

    // Initialize selected categories if editing
    if (widget.restaurant?.restaurantCategories?.edges != null) {
      _selectedCategories = widget.restaurant!.restaurantCategories!.edges!
          .map((e) => e?.node)
          .whereType<RestaurantCategory>()
          .toList();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _newOwnerEmailController.dispose();
    _newOwnerPasswordController.dispose();
    super.dispose();
  }

  Future<void> _uploadImage(String restaurantIri) async {
    if (_imageFile == null) return;
    final restaurantService = context.read<RestaurantService>();
    final bytes = await _imageFile!.readAsBytes();
    await restaurantService.updateRestaurantImage(
      restaurantIri,
      bytes,
      _imageFile!.name,
    );
  }

  void _saveRestaurant() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isSaving = true;
    });

    final authService = context.read<AuthService>();
    final userService = context.read<UserService>();
    final restaurantService = context.read<RestaurantService>();

    try {
      String? restaurantIri;
      final categoryIris = _selectedCategories.map((c) => c.id).toList();

      if (widget.isCreateMode) {
        // Check if admin is creating with new owner
        if (authService.hasRole("ROLE_ADMIN") &&
            _ownerMode == OwnerMode.createNew) {
          // Use RestaurantService.inviteRestaurantOwner to create user + restaurant
          restaurantIri = await restaurantService.inviteRestaurantOwner(
            email: _newOwnerEmailController.text,
            password: _newOwnerPasswordController.text,
            restaurantName: _nameController.text,
            description: _descriptionController.text.isNotEmpty
                ? _descriptionController.text
                : null,
            categoryIds: categoryIris,
          );
        } else {
          // Standard create restaurant flow
          restaurantIri = await restaurantService.createRestaurant(
            name: _nameController.text,
            description: _descriptionController.text,
            categoryIris: categoryIris,
          );

          // Assign Owner (Admin Only with existing user)
          if (authService.hasRole("ROLE_ADMIN") &&
              _selectedOwner != null &&
              restaurantIri != null) {
            await userService.updateUserRestaurant(
              _selectedOwner!.id,
              restaurantIri,
            );
          }
        }
      } else {
        restaurantIri = widget.restaurant.id;
        await restaurantService.updateRestaurant(
          id: restaurantIri!,
          name: _nameController.text,
          description: _descriptionController.text,
          categoryIris: categoryIris,
        );
      }

      // Upload Image (if selected in create mode)
      if (widget.isCreateMode && _imageFile != null && restaurantIri != null) {
        try {
          await _uploadImage(restaurantIri);
        } catch (e) {
          if (mounted) {
            UIErrorHandler.showSnackBar(
              context,
              'Restaurant created, but image upload failed. Please retry.',
              isError: true,
              action: SnackBarAction(
                label: 'Retry Upload',
                onPressed: () async {
                  try {
                    await _uploadImage(restaurantIri!);
                    if (mounted) {
                      UIErrorHandler.showSnackBar(
                        context,
                        'Image uploaded successfully!',
                        isError: false,
                      );
                      context.pop();
                    }
                  } catch (retryError) {
                    if (mounted) {
                      UIErrorHandler.showSnackBar(
                        context,
                        'Retry failed: $retryError',
                      );
                    }
                  }
                },
              ),
            );
            return; // Don't pop yet, let user retry
          }
        }
      }

      if (mounted) {
        UIErrorHandler.showSnackBar(
          context,
          widget.isCreateMode
              ? 'Restaurant created successfully!'
              : 'Restaurant updated successfully!',
          isError: false,
        );
        if (widget.isCreateMode) {
          // Refresh the restaurant list
          restaurantService.fetchAllRestaurants();
          context.pop();
        }
      }
    } catch (e) {
      if (mounted) {
        UIErrorHandler.handleError(
          context,
          e,
          customMessage: 'Failed to save restaurant',
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (!mounted) return;

    if (image != null) {
      if (widget.isCreateMode) {
        setState(() {
          _imageFile = image;
        });
      } else if (widget.restaurant != null) {
        final restaurantIri = widget.restaurant.id;
        try {
          final restaurantService = context.read<RestaurantService>();
          final bytes = await image.readAsBytes();
          await restaurantService.updateRestaurantImage(
            restaurantIri,
            bytes,
            image.name,
          );
          if (mounted) {
            UIErrorHandler.showSnackBar(
              context,
              'Image updated successfully!',
              isError: false,
            );
          }
        } catch (e) {
          if (mounted) {
            UIErrorHandler.showSnackBar(
              context,
              'Image upload failed. Please retry.',
              isError: true,
              action: SnackBarAction(
                label: 'Retry Upload',
                onPressed: () async {
                  try {
                    final restaurantService = context.read<RestaurantService>();
                    final bytes = await image.readAsBytes();
                    await restaurantService.updateRestaurantImage(
                      restaurantIri,
                      bytes,
                      image.name,
                    );
                    if (mounted) {
                      UIErrorHandler.showSnackBar(
                        context,
                        'Image uploaded successfully!',
                        isError: false,
                      );
                    }
                  } catch (retryError) {
                    if (mounted) {
                      UIErrorHandler.showSnackBar(
                        context,
                        'Retry failed: $retryError',
                      );
                    }
                  }
                },
              ),
            );
          }
        }
      }
    }
  }

  Future<void> _showCategorySelectionDialog() async {
    final categoryService = context.read<RestaurantCategoryService>();
    final allCategories = categoryService.restaurantCategories;

    await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Select Categories'),
              content: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (allCategories.isEmpty)
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('No categories available'),
                      )
                    else
                      Flexible(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: allCategories.length,
                          itemBuilder: (context, index) {
                            final category = allCategories[index];
                            final isSelected = _selectedCategories.any(
                              (c) => c.id == category.id,
                            );
                            return CheckboxListTile(
                              title: Text(category.name),
                              value: isSelected,
                              onChanged: (bool? value) {
                                setState(() {
                                  if (value == true) {
                                    _selectedCategories.add(category);
                                  } else {
                                    _selectedCategories.removeWhere(
                                      (c) => c.id == category.id,
                                    );
                                  }
                                });
                                // Update parent state to reflect changes in chips
                                this.setState(() {});
                              },
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Done'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildOwnerSection(AuthService authService, UserService userService) {
    if (!authService.hasRole("ROLE_ADMIN") || !widget.isCreateMode) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Restaurant Owner',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),

        // Owner mode toggle
        SegmentedButton<OwnerMode>(
          segments: const [
            ButtonSegment(
              value: OwnerMode.existing,
              label: Text('Select Existing'),
              icon: Icon(Icons.person_search),
            ),
            ButtonSegment(
              value: OwnerMode.createNew,
              label: Text('Create New'),
              icon: Icon(Icons.person_add),
            ),
          ],
          selected: {_ownerMode},
          onSelectionChanged: (Set<OwnerMode> selection) {
            setState(() {
              _ownerMode = selection.first;
              // Clear selections when switching modes
              if (_ownerMode == OwnerMode.existing) {
                _newOwnerEmailController.clear();
                _newOwnerPasswordController.clear();
              } else {
                _selectedOwner = null;
              }
            });
          },
        ),
        const SizedBox(height: 16),

        // Show appropriate input based on mode
        if (_ownerMode == OwnerMode.existing) ...[
          if (userService.isLoading)
            const Center(child: CircularProgressIndicator())
          else
            DropdownButtonFormField<Query$GetUsers$users$edges$node>(
              decoration: const InputDecoration(
                labelText: 'Select Owner',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              initialValue: _selectedOwner,
              items: userService.restaurantOwners
                  .map(
                    (user) =>
                        DropdownMenuItem(value: user, child: Text(user.email)),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedOwner = value;
                });
              },
              validator: (value) {
                if (_ownerMode == OwnerMode.existing && value == null) {
                  return 'Please select an owner';
                }
                return null;
              },
            ),
        ] else ...[
          TextFormField(
            controller: _newOwnerEmailController,
            decoration: const InputDecoration(
              labelText: 'Owner Email',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (_ownerMode == OwnerMode.createNew) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an email';
                }
                if (!value.contains('@')) {
                  return 'Please enter a valid email';
                }
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _newOwnerPasswordController,
            decoration: const InputDecoration(
              labelText: 'Owner Password',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock),
            ),
            obscureText: true,
            validator: (value) {
              if (_ownerMode == OwnerMode.createNew) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }
                if (value.length < 8) {
                  return 'Password must be at least 8 characters';
                }
              }
              return null;
            },
          ),
        ],
        const SizedBox(height: 24),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final authService = context.watch<AuthService>();
    final restaurantService = context.watch<RestaurantService>();
    final userService = context.watch<UserService>();

    final isLoading = restaurantService.isLoading || _isSaving;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          // Image Section (Always visible now)
          GestureDetector(
            onTap: isLoading ? null : _pickImage,
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  if (_imageFile != null)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.file(
                        File(_imageFile!.path),
                        fit: BoxFit.cover,
                      ),
                    )
                  else if (widget.restaurant?.imageUrl != null)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: CustomCachedImage(
                        imageUrl: widget.restaurant!.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  if (_imageFile == null && widget.restaurant?.imageUrl == null)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_a_photo,
                          size: 48,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Tap to add cover image',
                          style: TextStyle(
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    )
                  else
                    Stack(
                      children: [
                        Positioned(
                          bottom: 16,
                          right: 16,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 153),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        if (isLoading)
                          const Center(child: CircularProgressIndicator()),
                      ],
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Form Section
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: BorderSide(
                color: Theme.of(context).colorScheme.outlineVariant,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      widget.isCreateMode
                          ? 'New Restaurant Details'
                          : 'Restaurant Details',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Restaurant Name',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.store),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.description),
                        alignLabelWithHint: true,
                      ),
                      maxLines: 4,
                    ),
                    const SizedBox(height: 16),

                    // Categories Section
                    Text(
                      'Categories',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        ..._selectedCategories.map(
                          (category) => Chip(
                            label: Text(category.name),
                            onDeleted: () {
                              setState(() {
                                _selectedCategories.removeWhere(
                                  (c) => c.id == category.id,
                                );
                              });
                            },
                          ),
                        ),
                        ActionChip(
                          avatar: const Icon(Icons.add, size: 16),
                          label: const Text('Add'),
                          onPressed: _showCategorySelectionDialog,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Owner Selection (Admin Only in create mode)
                    _buildOwnerSection(authService, userService),

                    FilledButton.icon(
                      onPressed: isLoading ? null : _saveRestaurant,
                      icon: const Icon(Icons.save),
                      label: isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              widget.isCreateMode
                                  ? 'Create Restaurant'
                                  : 'Save Changes',
                            ),
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
