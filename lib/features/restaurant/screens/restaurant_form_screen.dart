import 'dart:io';
import 'package:flutter/foundation.dart';
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
import 'package:catering_flutter/core/utils/image_helper.dart';

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

      if (widget.restaurantIri != null) {
        restaurantService.getRestaurantById(widget.restaurantIri!);
      } else {
        restaurantService.clearCurrentRestaurant();
      }

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

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: widget.restaurant?.name ?? '',
    );
    _descriptionController = TextEditingController(
      text: widget.restaurant?.description ?? '',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
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

    final authService = context.read<AuthService>();
    final userService = context.read<UserService>();
    final restaurantService = context.read<RestaurantService>();

    try {
      String? restaurantIri;

      if (widget.isCreateMode) {
        restaurantIri = await restaurantService.createRestaurant(
          name: _nameController.text,
          description: _descriptionController.text,
        );
      } else {
        restaurantIri = widget.restaurant.id;
        await restaurantService.updateRestaurant(
          id: restaurantIri!,
          name: _nameController.text,
          description: _descriptionController.text,
        );
      }

      // Assign Owner (Admin Only)
      if (authService.hasRole("ROLE_ADMIN") &&
          _selectedOwner != null &&
          restaurantIri != null) {
        await userService.updateUserRestaurant(
          _selectedOwner!.id,
          restaurantIri,
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

  @override
  Widget build(BuildContext context) {
    final authService = context.watch<AuthService>();
    final restaurantService = context.watch<RestaurantService>();
    final userService = context.watch<UserService>();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          // Image Section (Always visible now)
          GestureDetector(
            onTap: restaurantService.isLoading ? null : _pickImage,
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(24),
                image: _imageFile != null
                    ? DecorationImage(
                        image: kIsWeb
                            ? NetworkImage(_imageFile!.path)
                            : FileImage(File(_imageFile!.path))
                                  as ImageProvider,
                        fit: BoxFit.cover,
                      )
                    : widget.restaurant?.imageUrl != null
                    ? DecorationImage(
                        image: NetworkImage(
                          ImageHelper.getFullImageUrl(
                            widget.restaurant!.imageUrl!,
                          )!,
                        ),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: (_imageFile == null && widget.restaurant?.imageUrl == null)
                  ? Column(
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
                  : Stack(
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
                        if (restaurantService.isLoading)
                          const Center(child: CircularProgressIndicator()),
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

                    // Owner Selection (Admin Only)
                    if (authService.hasRole("ROLE_ADMIN")) ...{
                      if (userService.isLoading)
                        const Center(child: CircularProgressIndicator())
                      else
                        DropdownButtonFormField<
                          Query$GetUsers$users$edges$node
                        >(
                          decoration: const InputDecoration(
                            labelText: 'Owner',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.person),
                          ),
                          initialValue: _selectedOwner,
                          items: userService.restaurantOwners
                              .map(
                                (user) => DropdownMenuItem(
                                  value: user,
                                  child: Text(user.email),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedOwner = value;
                            });
                          },
                          validator: (value) {
                            if (widget.isCreateMode && value == null) {
                              return 'Please select an owner';
                            }
                            return null;
                          },
                        ),
                      const SizedBox(height: 24),
                    },
                    FilledButton.icon(
                      onPressed: restaurantService.isLoading
                          ? null
                          : _saveRestaurant,
                      icon: const Icon(Icons.save),
                      label: restaurantService.isLoading
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
