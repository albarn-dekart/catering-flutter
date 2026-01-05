import 'dart:typed_data';

import 'package:catering_flutter/core/services/auth_service.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/widgets/filter_chips_bar.dart';
import 'package:catering_flutter/core/widgets/app_card.dart';
import 'package:catering_flutter/core/widgets/custom_text_field.dart';
import 'package:catering_flutter/core/widgets/global_error_widget.dart';
import 'package:catering_flutter/core/widgets/custom_cached_image.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/features/restaurant/services/restaurant_category_service.dart';
import 'package:catering_flutter/features/restaurant/services/restaurant_service.dart';
import 'package:catering_flutter/features/user/services/user_service.dart';
import 'package:catering_flutter/graphql/users.graphql.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:catering_flutter/core/widgets/app_premium_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class RestaurantFormScreen extends HookWidget {
  final String? restaurantIri;

  const RestaurantFormScreen({super.key, this.restaurantIri});

  @override
  Widget build(BuildContext context) {
    final restaurantService = context.watch<RestaurantService>();
    final authService = context.read<AuthService>();
    final userService = context.read<UserService>();
    final categoryService = context.read<RestaurantCategoryService>();
    final isCreateMode = restaurantIri == null;

    useEffect(() {
      Future.microtask(() async {
        if (restaurantIri != null) {
          await restaurantService.getRestaurantById(restaurantIri!);
        } else {
          restaurantService.clearCurrentRestaurant();
        }

        // Fetch Common Data
        await categoryService.getRestaurantCategories();
        if (authService.hasRole("ROLE_ADMIN")) {
          await userService.fetchRestaurantOwners();
        }
      });
      return null;
    }, [restaurantIri]);

    return CustomScaffold(
      title: isCreateMode
          ? AppLocalizations.of(context)!.createRestaurant
          : AppLocalizations.of(context)!.editDetails,
      child: Builder(
        builder: (context) {
          // 1. Initial Loading State
          if (restaurantService.isLoading &&
              !isCreateMode &&
              restaurantService.currentRestaurant == null) {
            return const Center(child: CircularProgressIndicator());
          }

          // 3. Error/Empty State
          if (restaurantService.hasError &&
              restaurantService.currentRestaurant == null) {
            return GlobalErrorWidget(
              message: restaurantService.errorMessage,
              onRetry: () =>
                  restaurantService.getRestaurantById(restaurantIri!),
              onCancel: () {
                restaurantService.clearError();
                context.pop();
              },
              withScaffold: false,
            );
          }

          if (!isCreateMode && restaurantService.currentRestaurant == null) {
            return Center(
              child: Text(AppLocalizations.of(context)!.noRestaurantData),
            );
          }

          return RestaurantForm(
            restaurant: restaurantService.currentRestaurant,
            isCreateMode: isCreateMode,
          );
        },
      ),
    );
  }
}

/// Enum to represent owner selection mode
enum OwnerMode { existing, createNew }

class RestaurantForm extends HookWidget {
  final dynamic restaurant; // GraphQL type
  final bool isCreateMode;

  const RestaurantForm({
    super.key,
    this.restaurant,
    required this.isCreateMode,
  });

  @override
  Widget build(BuildContext context) {
    // Form and Controller Hooks
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final nameController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final deliveryPriceController = useTextEditingController();
    final phoneNumberController = useTextEditingController();
    final emailController = useTextEditingController();
    final cityController = useTextEditingController();
    final streetController = useTextEditingController();
    final zipCodeController = useTextEditingController();
    final nipController = useTextEditingController();
    final newOwnerEmailController = useTextEditingController();

    // State Hooks
    final selectedCategories = useState<List<RestaurantCategory>>([]);
    final selectedOwner = useState<Query$GetUsers$users$edges$node?>(null);
    final imageBytes = useState<Uint8List?>(null);
    final imageName = useState<String?>(null);
    final ownerMode = useState<OwnerMode>(OwnerMode.existing);
    final isSaving = useState(false);
    final isOwnerInitialized = useState(false);

    // Sync Form with Data
    useEffect(() {
      nameController.text = restaurant?.name ?? '';
      descriptionController.text = restaurant?.description ?? '';
      deliveryPriceController.text = restaurant?.deliveryPrice != null
          ? (restaurant!.deliveryPrice / 100).toStringAsFixed(2)
          : '';
      phoneNumberController.text = restaurant?.phoneNumber ?? '';
      emailController.text = restaurant?.email ?? '';
      cityController.text = restaurant?.city ?? '';
      streetController.text = restaurant?.street ?? '';
      zipCodeController.text = restaurant?.zipCode ?? '';
      nipController.text = restaurant?.nip ?? '';

      // Reset Image
      imageBytes.value = null;
      imageName.value = null;

      // Handle Categories
      if (restaurant?.restaurantCategories?.edges != null) {
        selectedCategories.value =
            (restaurant!.restaurantCategories!.edges! as List)
                .map((e) => e?.node)
                .where((node) => node != null)
                .map<RestaurantCategory>(
                  (node) => RestaurantCategory(
                    id: node!.id,
                    name: node.name,
                    $__typename: 'RestaurantCategory',
                  ),
                )
                .toList();
      } else {
        selectedCategories.value = [];
      }

      // Reset Owner State
      selectedOwner.value = null;
      isOwnerInitialized.value = false;
      ownerMode.value = OwnerMode.existing;
      newOwnerEmailController.clear();

      return null;
    }, [restaurant]);

    // Helpers
    Future<void> pickImage() async {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        final bytes = await image.readAsBytes();
        imageBytes.value = bytes;
        imageName.value = image.name;
      }
    }

    Future<void> saveRestaurant() async {
      if (!formKey.currentState!.validate()) return;
      isSaving.value = true;

      final authService = context.read<AuthService>();
      final restaurantService = context.read<RestaurantService>();
      bool imageUploadFailed = false;

      try {
        String? restaurantIri;
        final categoryIris = selectedCategories.value.map((c) => c.id).toList();
        final deliveryPriceVal = deliveryPriceController.text.isNotEmpty
            ? (double.parse(deliveryPriceController.text) * 100).toInt()
            : 0;

        if (isCreateMode) {
          if (authService.hasRole("ROLE_ADMIN") &&
              ownerMode.value == OwnerMode.createNew) {
            restaurantIri = await restaurantService.inviteRestaurantOwner(
              email: newOwnerEmailController.text,
              restaurantName: nameController.text,
              description: descriptionController.text.isNotEmpty
                  ? descriptionController.text
                  : null,
              categoryIds: categoryIris,
              deliveryPrice: deliveryPriceVal,
              phoneNumber: phoneNumberController.text.isNotEmpty
                  ? phoneNumberController.text
                  : null,
              restaurantEmail: emailController.text.isNotEmpty
                  ? emailController.text
                  : null,
              city: cityController.text.isNotEmpty ? cityController.text : null,
              street: streetController.text.isNotEmpty
                  ? streetController.text
                  : null,
              zipCode: zipCodeController.text.isNotEmpty
                  ? zipCodeController.text
                  : null,
              nip: nipController.text.isNotEmpty ? nipController.text : null,
            );
          } else {
            restaurantIri = await restaurantService.createRestaurant(
              name: nameController.text,
              description: descriptionController.text,
              deliveryPrice: deliveryPriceVal,
              categoryIris: categoryIris,
              phoneNumber: phoneNumberController.text,
              email: emailController.text,
              city: cityController.text,
              street: streetController.text,
              zipCode: zipCodeController.text,
              nip: nipController.text,
              ownerIri: authService.hasRole("ROLE_ADMIN")
                  ? selectedOwner.value?.id
                  : null,
            );
          }
        } else {
          restaurantIri = restaurant.id;
          String? ownerIriToPass;
          bool shouldUnassignOwner = false;

          if (authService.hasRole("ROLE_ADMIN")) {
            final currentOwnerId = restaurant?.owner?.id;
            if (selectedOwner.value?.id != currentOwnerId) {
              if (selectedOwner.value == null) {
                shouldUnassignOwner = true;
              } else {
                ownerIriToPass = selectedOwner.value?.id;
              }
            }
          }

          await restaurantService.updateRestaurant(
            id: restaurant!.id,
            name: nameController.text,
            description: descriptionController.text,
            deliveryPrice: deliveryPriceVal,
            categoryIris: categoryIris,
            phoneNumber: phoneNumberController.text,
            email: emailController.text,
            city: cityController.text,
            street: streetController.text,
            zipCode: zipCodeController.text,
            nip: nipController.text,
            ownerIri: ownerIriToPass,
            unassignOwner: shouldUnassignOwner,
          );
        }

        // Upload Image
        if (imageBytes.value != null && restaurantIri != null) {
          try {
            await restaurantService.updateRestaurantImage(
              restaurantIri,
              imageBytes.value!,
              imageName.value ?? 'image.jpg',
            );
          } catch (e) {
            imageUploadFailed = true;
          }
        }

        if (context.mounted) {
          final message = imageUploadFailed
              ? AppLocalizations.of(context)!.restaurantCreatedImageFailed
              : (isCreateMode
                    ? AppLocalizations.of(context)!.restaurantCreatedSuccess
                    : AppLocalizations.of(context)!.restaurantUpdatedSuccess);

          UIErrorHandler.showSnackBar(
            context,
            message,
            isError: imageUploadFailed,
          );
          context.pop();
        }
      } catch (e) {
        if (context.mounted) {
          UIErrorHandler.handleError(
            context,
            e,
            customMessage: AppLocalizations.of(context)!.failedToSaveRestaurant,
          );
        }
      } finally {
        isSaving.value = false;
      }
    }

    final authService = context.watch<AuthService>();
    final restaurantService = context.watch<RestaurantService>();
    final userService = context.watch<UserService>();
    final isLoading = restaurantService.isLoading || isSaving.value;

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          // Build Image Picker
          _buildImagePicker(
            context,
            imageBytes,
            imageName,
            pickImage,
            isLoading,
            isCreateMode ? null : restaurant?.imageUrl,
          ),
          const SizedBox(height: 24),

          AppCard(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    isCreateMode
                        ? AppLocalizations.of(context)!.newRestaurantDetails
                        : AppLocalizations.of(context)!.restaurantDetails,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 24),

                  // Inputs
                  _buildTextField(
                    context,
                    controller: nameController,
                    label: AppLocalizations.of(context)!.restaurantName,
                    icon: Icons.store,
                    validator: (v) => v?.isEmpty ?? true
                        ? AppLocalizations.of(context)!.pleaseEnterName
                        : null,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    context,
                    controller: descriptionController,
                    label: AppLocalizations.of(context)!.description,
                    icon: Icons.description,
                    maxLines: 4,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    context,
                    controller: deliveryPriceController,
                    label: AppLocalizations.of(context)!.deliveryFee,
                    icon: Icons.attach_money,
                    suffixText: "PLN",
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    validator: (v) {
                      if (v != null &&
                          v.isNotEmpty &&
                          double.tryParse(v) == null) {
                        return AppLocalizations.of(context)!.invalidFormat;
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

                  _buildTextField(
                    context,
                    controller: phoneNumberController,
                    label: AppLocalizations.of(context)!.phoneNumber,
                    icon: Icons.phone,
                    validator: (v) {
                      if (v != null && v.isNotEmpty) {
                        final phoneRegex = RegExp(
                          r'^(\+?48)?[ -]?\d{3}[ -]?\d{3}[ -]?\d{3}$',
                        );
                        if (!phoneRegex.hasMatch(v)) {
                          return AppLocalizations.of(
                            context,
                          )!.invalidPhoneNumber;
                        }
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    context,
                    controller: emailController,
                    label: AppLocalizations.of(context)!.email,
                    icon: Icons.email,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return AppLocalizations.of(context)!.pleaseEnterEmail;
                      }
                      final emailRegex = RegExp(
                        r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
                      );
                      if (!emailRegex.hasMatch(v)) {
                        return AppLocalizations.of(
                          context,
                        )!.pleaseEnterValidEmail;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: _buildTextField(
                          context,
                          controller: cityController,
                          label: AppLocalizations.of(context)!.city,
                          icon: Icons.location_city,
                          validator: (v) => v?.isEmpty ?? true
                              ? AppLocalizations.of(context)!.fieldRequired
                              : null,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildTextField(
                          context,
                          controller: zipCodeController,
                          label: AppLocalizations.of(context)!.zipCode,
                          icon: Icons.numbers,
                          validator: (v) {
                            if (v == null || v.isEmpty) {
                              return AppLocalizations.of(
                                context,
                              )!.fieldRequired;
                            }
                            if (!RegExp(r'^\d{2}-\d{3}$').hasMatch(v)) {
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
                  _buildTextField(
                    context,
                    controller: streetController,
                    label: AppLocalizations.of(context)!.street,
                    icon: Icons.home,
                    validator: (v) => v?.isEmpty ?? true
                        ? AppLocalizations.of(context)!.fieldRequired
                        : null,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    context,
                    controller: nipController,
                    label: "NIP",
                    icon: Icons.confirmation_number,
                    validator: (v) {
                      if (v != null &&
                          v.isNotEmpty &&
                          !RegExp(r'^\d{10}$').hasMatch(v)) {
                        return AppLocalizations.of(context)!.invalidNip;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Categories
                  Text(
                    AppLocalizations.of(context)!.categories,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  _buildCategories(context, selectedCategories),

                  const SizedBox(height: 8),
                  // Owner Section
                  _buildOwnerSection(
                    context,
                    authService,
                    userService,
                    isCreateMode,
                    restaurant,
                    selectedOwner,
                    ownerMode,
                    newOwnerEmailController,
                    isOwnerInitialized,
                  ),

                  const SizedBox(height: 24),
                  AppPremiumButton(
                    onPressed: saveRestaurant,
                    label: isCreateMode
                        ? AppLocalizations.of(context)!.createRestaurant
                        : AppLocalizations.of(context)!.saveChanges,
                    isLoading: isLoading,
                    icon: Icons.save,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper Widgets to clean up build method

  Widget _buildTextField(
    BuildContext context, {
    required TextEditingController controller,
    required String label,
    required IconData icon,
    String? suffixText,
    int? maxLines = 1,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return CustomTextField(
      controller: controller,
      labelText: label,
      hintText: label,
      prefixIcon: Icon(icon),
      suffixText: suffixText,
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
    );
  }

  Widget _buildImagePicker(
    BuildContext context,
    ValueNotifier<Uint8List?> imageBytes,
    ValueNotifier<String?> imageName,
    VoidCallback onPick,
    bool isLoading,
    String? currentImageUrl,
  ) {
    return GestureDetector(
      onTap: isLoading ? null : onPick,
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
            if (imageBytes.value != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.memory(imageBytes.value!, fit: BoxFit.cover),
              )
            else if (currentImageUrl != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: CustomCachedImage(
                  imageUrl: currentImageUrl,
                  fit: BoxFit.cover,
                ),
              )
            else
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
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            if (imageBytes.value != null || currentImageUrl != null)
              Stack(
                children: [
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).colorScheme.scrim.withValues(alpha: 0.6),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  if (imageBytes.value != null)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: IconButton.filledTonal(
                        onPressed: () {
                          imageBytes.value = null;
                          imageName.value = null;
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ),
                ],
              ),
            if (isLoading) const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }

  Widget _buildCategories(
    BuildContext context,
    ValueNotifier<List<RestaurantCategory>> selectedCategories,
  ) {
    final categoryService = context.read<RestaurantCategoryService>();
    final allCategories = categoryService.restaurantCategories;

    if (allCategories.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          AppLocalizations.of(context)!.noCategoriesAvailable,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
      );
    }

    return FilterChipsBar<RestaurantCategory>(
      values: allCategories,
      selectedValues: selectedCategories.value,
      onSelectedList: (items) {
        selectedCategories.value = items;
      },
      labelBuilder: (category) => category.name,
    );
  }

  Widget _buildOwnerSection(
    BuildContext context,
    AuthService authService,
    UserService userService,
    bool isCreateMode,
    dynamic restaurant,
    ValueNotifier<Query$GetUsers$users$edges$node?> selectedOwner,
    ValueNotifier<OwnerMode> ownerMode,
    TextEditingController newOwnerEmailController,
    ValueNotifier<bool> isOwnerInitialized,
  ) {
    if (!authService.hasRole("ROLE_ADMIN")) {
      return const SizedBox.shrink();
    }

    // Initialize/Sync owner selection if needed
    if (!isCreateMode &&
        restaurant?.owner != null &&
        selectedOwner.value == null &&
        !isOwnerInitialized.value &&
        userService.restaurantOwners.isNotEmpty) {
      final currentOwnerId = restaurant!.owner!.id;
      final matchingOwner = userService.restaurantOwners
          .where((u) => u.id == currentOwnerId)
          .firstOrNull;

      // Update state without triggering rebuild during build
      Future.microtask(() {
        if (isOwnerInitialized.value) return;
        if (matchingOwner != null) {
          selectedOwner.value = matchingOwner;
        }
        isOwnerInitialized.value = true;
      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isCreateMode) ...[
          SegmentedButton<OwnerMode>(
            segments: [
              ButtonSegment(
                value: OwnerMode.existing,
                label: Text(AppLocalizations.of(context)!.selectExisting),
                icon: const Icon(Icons.person_search),
              ),
              ButtonSegment(
                value: OwnerMode.createNew,
                label: Text(AppLocalizations.of(context)!.createNew),
                icon: const Icon(Icons.person_add),
              ),
            ],
            selected: {ownerMode.value},
            onSelectionChanged: (Set<OwnerMode> selection) {
              ownerMode.value = selection.first;
              if (ownerMode.value == OwnerMode.existing) {
                newOwnerEmailController.clear();
              } else {
                selectedOwner.value = null;
              }
            },
          ),
          const SizedBox(height: 16),
        ],
        if (!isCreateMode || ownerMode.value == OwnerMode.existing) ...[
          if (userService.isLoading)
            const Center(child: CircularProgressIndicator())
          else
            DropdownButtonFormField<String?>(
              isExpanded: true,
              decoration: InputDecoration(
                labelText: isCreateMode
                    ? AppLocalizations.of(context)!.selectOwner
                    : AppLocalizations.of(context)!.restaurantOwner,
                prefixIcon: const Icon(Icons.person),
              ),
              initialValue: selectedOwner.value?.id,
              items: [
                DropdownMenuItem<String?>(
                  value: null,
                  child: Text(AppLocalizations.of(context)!.noOwner),
                ),
                ...userService.restaurantOwners
                    .where((user) {
                      // 1. User has no restaurant assigned
                      final isUnassigned = user.ownedRestaurant == null;
                      // 2. User is the current owner of the restaurant we are editing
                      final isCurrentOwner =
                          !isCreateMode && restaurant?.owner?.id == user.id;

                      return isUnassigned || isCurrentOwner;
                    })
                    .map(
                      (user) => DropdownMenuItem<String?>(
                        value: user.id,
                        child: Text(
                          user.email,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
              ],
              onChanged: (value) {
                if (value == null) {
                  selectedOwner.value = null;
                } else {
                  selectedOwner.value = userService.restaurantOwners.firstWhere(
                    (u) => u.id == value,
                  );
                }
              },
              validator: (value) {
                if (isCreateMode &&
                    ownerMode.value == OwnerMode.existing &&
                    value == null) {
                  return AppLocalizations.of(context)!.pleaseSelectOwner;
                }
                return null;
              },
            ),
        ],
        if (isCreateMode && ownerMode.value == OwnerMode.createNew) ...[
          CustomTextField(
            controller: newOwnerEmailController,
            labelText: AppLocalizations.of(context)!.ownerEmail,
            hintText: AppLocalizations.of(context)!.ownerEmail,
            prefixIcon: const Icon(Icons.email),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppLocalizations.of(context)!.pleaseEnterEmail;
              }
              final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (!emailRegex.hasMatch(value)) {
                return AppLocalizations.of(context)!.pleaseEnterValidEmail;
              }
              return null;
            },
          ),
          const SizedBox(height: 4),
          Text(
            AppLocalizations.of(context)!.courierPasswordWillBeEmailed,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
        const SizedBox(height: 24),
      ],
    );
  }
}
