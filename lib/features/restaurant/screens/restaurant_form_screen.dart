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
import 'package:catering_flutter/core/services/auth_service.dart';
import 'package:catering_flutter/core/widgets/custom_cached_image.dart';
import 'package:catering_flutter/features/restaurant/services/restaurant_category_service.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';

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
      title: isCreateMode
          ? AppLocalizations.of(context)!.createRestaurant
          : AppLocalizations.of(context)!.editDetails,
      child: Consumer<RestaurantService>(
        builder: (context, restaurantService, child) {
          if (restaurantService.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (restaurantService.hasError) {
            return Center(child: Text(restaurantService.errorMessage!));
          } else if (!isCreateMode &&
              restaurantService.currentRestaurant == null) {
            return Center(
              child: Text(AppLocalizations.of(context)!.noRestaurantData),
            );
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
  late final TextEditingController _deliveryPriceController;
  late final TextEditingController _phoneNumberController;
  late final TextEditingController _emailController;
  late final TextEditingController _cityController;
  late final TextEditingController _streetController;
  late final TextEditingController _zipCodeController;
  late final TextEditingController _nipController;
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
    _deliveryPriceController = TextEditingController(
      text: widget.restaurant?.deliveryPrice != null
          ? (widget.restaurant!.deliveryPrice / 100).toStringAsFixed(2)
          : '',
    );
    _phoneNumberController = TextEditingController(
      text: widget.restaurant?.phoneNumber ?? '',
    );
    _emailController = TextEditingController(
      text: widget.restaurant?.email ?? '',
    );
    _cityController = TextEditingController(
      text: widget.restaurant?.city ?? '',
    );
    _streetController = TextEditingController(
      text: widget.restaurant?.street ?? '',
    );
    _zipCodeController = TextEditingController(
      text: widget.restaurant?.zipCode ?? '',
    );
    _nipController = TextEditingController(text: widget.restaurant?.nip ?? '');

    // Initialize selected categories if editing
    if (widget.restaurant?.restaurantCategories?.edges != null) {
      _selectedCategories = widget.restaurant!.restaurantCategories!.edges!
          .map((e) => e?.node)
          .where((node) => node != null)
          .map(
            (node) => RestaurantCategory(
              id: node!.id,
              name: node.name,
              $__typename: 'RestaurantCategory',
            ),
          )
          .toList();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _deliveryPriceController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _cityController.dispose();
    _streetController.dispose();
    _zipCodeController.dispose();
    _nipController.dispose();
    _newOwnerEmailController.dispose();

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
            deliveryPrice:
                (double.parse(
                          _deliveryPriceController.text.isEmpty
                              ? '0'
                              : _deliveryPriceController.text,
                        ) *
                        100)
                    .toInt(),
            categoryIris: categoryIris,
            phoneNumber: _phoneNumberController.text,
            email: _emailController.text,
            city: _cityController.text,
            street: _streetController.text,
            zipCode: _zipCodeController.text,
            nip: _nipController.text,
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
          deliveryPrice:
              (double.parse(
                        _deliveryPriceController.text.isEmpty
                            ? '0'
                            : _deliveryPriceController.text,
                      ) *
                      100)
                  .toInt(),
          categoryIris: categoryIris,
          phoneNumber: _phoneNumberController.text,
          email: _emailController.text,
          city: _cityController.text,
          street: _streetController.text,
          zipCode: _zipCodeController.text,
          nip: _nipController.text,
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
              AppLocalizations.of(context)!.restaurantCreatedImageFailed,
              isError: true,
              action: SnackBarAction(
                label: AppLocalizations.of(context)!.retryUpload,
                onPressed: () async {
                  try {
                    await _uploadImage(restaurantIri!);
                    if (mounted) {
                      UIErrorHandler.showSnackBar(
                        context,
                        AppLocalizations.of(context)!.imageUploadedSuccess,
                        isError: false,
                      );
                      context.pop();
                    }
                  } catch (retryError) {
                    if (mounted) {
                      UIErrorHandler.showSnackBar(
                        context,
                        AppLocalizations.of(
                          context,
                        )!.retryFailed(retryError.toString()),
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
              ? AppLocalizations.of(context)!.restaurantCreatedSuccess
              : AppLocalizations.of(context)!.restaurantUpdatedSuccess,
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
          customMessage: AppLocalizations.of(context)!.failedToSaveRestaurant,
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
              AppLocalizations.of(context)!.imageUpdatedSuccess,
              isError: false,
            );
          }
        } catch (e) {
          if (mounted) {
            UIErrorHandler.showSnackBar(
              context,
              AppLocalizations.of(context)!.imageUploadFailed,
              isError: true,
              action: SnackBarAction(
                label: AppLocalizations.of(context)!.retryUpload,
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
                        AppLocalizations.of(context)!.imageUploadedSuccess,
                        isError: false,
                      );
                    }
                  } catch (retryError) {
                    if (mounted) {
                      UIErrorHandler.showSnackBar(
                        context,
                        AppLocalizations.of(
                          context,
                        )!.retryFailed(retryError.toString()),
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
              title: Text(AppLocalizations.of(context)!.selectCategories),
              content: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (allCategories.isEmpty)
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          AppLocalizations.of(context)!.noCategoriesAvailable,
                        ),
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
                  child: Text(AppLocalizations.of(context)!.done),
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
          AppLocalizations.of(context)!.restaurantOwner,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),

        // Owner mode toggle
        SegmentedButton<OwnerMode>(
          segments: [
            ButtonSegment(
              value: OwnerMode.existing,
              label: Expanded(
                child: Center(
                  child: Text(
                    AppLocalizations.of(context)!.selectExisting,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              icon: const Icon(Icons.person_search),
            ),
            ButtonSegment(
              value: OwnerMode.createNew,
              label: Expanded(
                child: Center(
                  child: Text(
                    AppLocalizations.of(context)!.createNew,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              icon: const Icon(Icons.person_add),
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
              isExpanded: true,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.selectOwner,
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              initialValue: _selectedOwner,
              items: userService.restaurantOwners
                  .map(
                    (user) => DropdownMenuItem(
                      value: user,
                      child: Text(user.email, overflow: TextOverflow.ellipsis),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedOwner = value;
                });
              },
              validator: (value) {
                if (_ownerMode == OwnerMode.existing && value == null) {
                  return AppLocalizations.of(context)!.pleaseSelectOwner;
                }
                return null;
              },
            ),
        ] else ...[
          TextFormField(
            controller: _newOwnerEmailController,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.ownerEmail,
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (_ownerMode == OwnerMode.createNew) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.pleaseEnterEmail;
                }
                // Simple email regex
                final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                if (!emailRegex.hasMatch(value)) {
                  return AppLocalizations.of(context)!.pleaseEnterValidEmail;
                }
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          Text(
            AppLocalizations.of(context)!.driverPasswordWillBeEmailed,
            style: Theme.of(context).textTheme.bodySmall,
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
      physics: const AlwaysScrollableScrollPhysics(),
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
                          AppLocalizations.of(context)!.tapToAddCoverImage,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
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
                          ? AppLocalizations.of(context)!.newRestaurantDetails
                          : AppLocalizations.of(context)!.restaurantDetails,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.restaurantName,
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.store),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!.pleaseEnterName;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.description,
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.description),
                        alignLabelWithHint: true,
                      ),
                      maxLines: 4,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _deliveryPriceController,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(
                          context,
                        )!.deliveryPricePLN,
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.attach_money),
                        suffixText: "PLN",
                      ),
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          if (double.tryParse(value) == null) {
                            return AppLocalizations.of(context)!.invalidFormat;
                          }
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    Text(
                      AppLocalizations.of(context)!.contactDetails,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _phoneNumberController,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.phoneNumber,
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.phone),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return null;
                        }

                        if (value.isEmpty) {
                          return AppLocalizations.of(context)!.fieldRequired;
                        }
                        final phoneRegex = RegExp(
                          r'^(\+?48)?[ -]?\d{3}[ -]?\d{3}[ -]?\d{3}$',
                        );
                        if (!phoneRegex.hasMatch(value)) {
                          return AppLocalizations.of(
                            context,
                          )!.invalidPhoneNumber;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.email,
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          // Simple email regex or use standard validator package if available, but here simple is fine or just required.
                          // Address entity has no email, but Restaurant does.
                          // AddressFormScreen doesn't validate email.
                          // I'll make it required since I'm making phone required.
                          if (!value.contains('@')) {
                            return AppLocalizations.of(context)!.invalidEmail;
                          }
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: _cityController,
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context)!.city,
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.location_city),
                            ),
                            validator: (value) => value?.isEmpty ?? true
                                ? AppLocalizations.of(context)!.fieldRequired
                                : null,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            controller: _zipCodeController,
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context)!.zipCode,
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.numbers),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppLocalizations.of(
                                  context,
                                )!.fieldRequired;
                              }
                              if (!RegExp(r'^\d{2}-\d{3}$').hasMatch(value)) {
                                return AppLocalizations.of(
                                  context,
                                )!.invalidZipCode;
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _streetController,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.street,
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.home),
                      ),
                      validator: (value) => value?.isEmpty ?? true
                          ? AppLocalizations.of(context)!.fieldRequired
                          : null,
                    ),
                    const SizedBox(height: 16),

                    TextFormField(
                      controller: _nipController,
                      decoration: InputDecoration(
                        labelText: "NIP",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.confirmation_number),
                      ),
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                            return "Invalid NIP (10 digits)";
                          }
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Categories Section
                    Text(
                      AppLocalizations.of(context)!.categories,
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
                          label: Text(AppLocalizations.of(context)!.add),
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
