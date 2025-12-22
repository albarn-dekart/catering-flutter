import 'dart:typed_data';

import 'package:catering_flutter/core/app_router.dart';
import 'package:catering_flutter/core/services/auth_service.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/widgets/global_error_widget.dart';
import 'package:catering_flutter/core/widgets/custom_cached_image.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/widgets/macro_badge.dart';
import 'package:catering_flutter/core/widgets/price_text.dart';
import 'package:catering_flutter/features/restaurant/screens/restaurant_meals_screen.dart';
import 'package:catering_flutter/features/restaurant/services/meal_plan_service.dart';
import 'package:catering_flutter/features/restaurant/services/meal_service.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class RestaurantMealPlanFormScreen extends HookWidget {
  final String? mealPlanId;
  final String restaurantIri;
  final bool isCustomer;

  const RestaurantMealPlanFormScreen({
    super.key,
    this.mealPlanId,
    required this.restaurantIri,
    this.isCustomer = false,
  });

  @override
  Widget build(BuildContext context) {
    // Services
    final mealPlanService = context.watch<MealPlanService>();
    final mealService = context.read<MealService>();
    final authService = context.read<AuthService>();

    // Form & Controllers
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final nameController = useTextEditingController();
    final descriptionController = useTextEditingController();

    // State
    final selectedMeals = useState<List<Meal?>>(List.filled(5, null));
    final imageBytes = useState<Uint8List?>(null);
    final imageName = useState<String?>(null);
    final isSaving = useState(false);
    final savedMealPlanId = useState<String?>(mealPlanId);

    // Initial Fetch & Clear
    useEffect(() {
      Future.microtask(() async {
        mealPlanService.clearCurrentMealPlan();
        mealService.fetchMealsByRestaurant(restaurantIri);

        if (mealPlanId != null) {
          await mealPlanService.getMealPlanById(mealPlanId!);
        }
      });
      return null;
    }, [mealPlanId]);

    // Sync Form Data
    useEffect(() {
      final mealPlan = mealPlanService.currentMealPlan;

      if (mealPlan != null) {
        nameController.text = mealPlan.name;
        descriptionController.text = mealPlan.description ?? '';

        if (mealPlan.meals?.edges != null) {
          final edges = mealPlan.meals!.edges!;
          final newSelection = List<Meal?>.filled(5, null);
          for (int i = 0; i < edges.length && i < 5; i++) {
            final node = edges[i]?.node;
            if (node is Meal) {
              newSelection[i] = node;
            }
          }
          selectedMeals.value = newSelection;
        }
      } else if (mealPlanId == null) {
        // Explicit create mode reset
        nameController.clear();
        descriptionController.clear();
        selectedMeals.value = List.filled(5, null);
      }
      return null;
    }, [mealPlanService.currentMealPlan]);

    // Computed Properties
    final currentMeals = selectedMeals.value.whereType<Meal>();
    final totalCalories = currentMeals.fold<double>(
      0,
      (sum, m) => sum + m.calories,
    );
    final totalProtein = currentMeals.fold<double>(
      0,
      (sum, m) => sum + m.protein,
    );
    final totalFat = currentMeals.fold<double>(0, (sum, m) => sum + m.fat);
    final totalCarbs = currentMeals.fold<double>(0, (sum, m) => sum + m.carbs);
    final totalPrice = currentMeals.fold<double>(0, (sum, m) => sum + m.price);

    // Handlers
    Future<void> pickImage() async {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        final bytes = await image.readAsBytes();
        imageBytes.value = bytes;
        imageName.value = image.name;
      }
    }

    Future<void> saveMealPlan() async {
      if (!formKey.currentState!.validate()) return;

      final selectedIds = selectedMeals.value
          .whereType<Meal>()
          .map((m) => m.id)
          .toList();

      if (selectedIds.isEmpty) {
        if (context.mounted) {
          UIErrorHandler.showSnackBar(
            context,
            AppLocalizations.of(context)!.selectAtLeastOneMeal,
            isError: true,
          );
        }
        return;
      }

      isSaving.value = true;
      bool imageUploadFailed = false;

      // Use read to avoid rebuilds inside async function if not needed,
      // but we already have service instance.
      try {
        String? currentId = savedMealPlanId.value;

        if (currentId == null) {
          // Create
          currentId = await mealPlanService.createMealPlan(
            restaurantIri: restaurantIri,
            name: nameController.text,
            description: descriptionController.text,
            mealIds: selectedIds,
            ownerIri: isCustomer ? authService.userIri : null,
          );
          savedMealPlanId.value = currentId;
        } else {
          // Update
          await mealPlanService.updateMealPlan(
            id: currentId,
            name: nameController.text,
            description: descriptionController.text,
            mealIds: selectedIds,
          );
        }

        // Upload Image
        if (imageBytes.value != null && currentId != null && !isCustomer) {
          try {
            await mealPlanService.updateMealPlanImage(
              currentId,
              imageBytes.value!,
              imageName.value ?? 'image.jpg',
            );
          } catch (e) {
            imageUploadFailed = true;
          }
        }

        if (context.mounted) {
          String message;
          if (imageUploadFailed) {
            message = AppLocalizations.of(context)!.mealPlanSavedImageFailed;
          } else {
            message = isCustomer
                ? AppLocalizations.of(context)!.mealPlanCreated
                : AppLocalizations.of(context)!.mealPlanSavedSuccess;
          }

          UIErrorHandler.showSnackBar(
            context,
            message,
            isError: imageUploadFailed,
          );

          if (isCustomer) {
            context.go(AppRoutes.myMealPlans);
          } else {
            context.pop();
          }
        }
      } catch (e) {
        if (context.mounted) {
          UIErrorHandler.handleError(
            context,
            e,
            customMessage: AppLocalizations.of(context)!.mealPlanSaveFailed,
          );
        }
      } finally {
        isSaving.value = false;
      }
    }

    // Stale Data Guard
    final isCreateMode = mealPlanId == null;

    // Guard: Create Mode but we have a non-null currentMealPlan (stale)
    if (isCreateMode && mealPlanService.currentMealPlan != null) {
      return const Center(child: CircularProgressIndicator());
    }

    // Guard: Normal Edit Error
    if (mealPlanService.hasError && mealPlanService.currentMealPlan == null) {
      return GlobalErrorWidget(
        message: mealPlanService.errorMessage,
        onRetry: () => mealPlanService.getMealPlanById(mealPlanId!),
      );
    }

    // Guard: Edit Mode but loading generic
    if (mealPlanService.isLoading &&
        !isCreateMode &&
        mealPlanService.currentMealPlan == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final isLoading = mealPlanService.isLoading || isSaving.value;
    final currentMealPlan = mealPlanService.currentMealPlan;

    // Title
    String title = isCreateMode
        ? AppLocalizations.of(context)!.createMealPlan
        : AppLocalizations.of(context)!.editMealPlan;
    if (isCustomer) {
      title = AppLocalizations.of(context)!.createCustomPlan;
    }

    return CustomScaffold(
      title: title,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Section
              if (!isCustomer) ...[
                _buildImagePicker(
                  context,
                  imageBytes,
                  imageName,
                  pickImage,
                  isLoading,
                  (!isCreateMode && currentMealPlan != null)
                      ? currentMealPlan.imageUrl
                      : null,
                ),
                const SizedBox(height: 16),
              ],

              // Name
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: isCustomer
                      ? AppLocalizations.of(context)!.planName
                      : AppLocalizations.of(context)!.mealPlanName,
                  border: const OutlineInputBorder(),
                ),
                validator: (v) => v?.isEmpty ?? true
                    ? AppLocalizations.of(context)!.pleaseEnterName
                    : null,
              ),
              const SizedBox(height: 16),

              // Description
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.description,
                  border: const OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 24),

              // Meals
              Text(
                AppLocalizations.of(context)!.selectedMeals,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),

              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                separatorBuilder: (_, _) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final meal = selectedMeals.value[index];
                  final isSelected = meal != null;

                  return InkWell(
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => RestaurantMealsScreen(
                            restaurantIri: restaurantIri,
                            isSelectionMode: true,
                          ),
                        ),
                      );
                      if (result != null && result is Meal) {
                        final newList = List<Meal?>.from(selectedMeals.value);
                        newList[index] = result;
                        selectedMeals.value = newList;
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.outline,
                          style: isSelected
                              ? BorderStyle.solid
                              : BorderStyle.none,
                        ),
                        boxShadow: [
                          if (isSelected)
                            BoxShadow(
                              color: Theme.of(
                                context,
                              ).colorScheme.shadow.withValues(alpha: 0.05),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                        ],
                      ),
                      child: isSelected
                          ? Padding(
                              padding: const EdgeInsets.all(12),
                              child: Row(
                                children: [
                                  if (meal.imageUrl != null)
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: CustomCachedImage(
                                        imageUrl: meal.imageUrl,
                                        width: 60,
                                        height: 60,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                meal.name,
                                                style: Theme.of(
                                                  context,
                                                ).textTheme.titleMedium,
                                              ),
                                            ),
                                            PriceText(
                                              priceGroszy: meal.price,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.copyWith(
                                                    color: Theme.of(
                                                      context,
                                                    ).colorScheme.primary,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        Wrap(
                                          spacing: 4,
                                          runSpacing: 4,
                                          children: [
                                            MacroBadge(
                                              text:
                                                  '${AppLocalizations.of(context)!.calories}: ${meal.calories.toStringAsFixed(0)}',
                                              icon: Icons
                                                  .local_fire_department_outlined,
                                            ),
                                            MacroBadge(
                                              text:
                                                  '${AppLocalizations.of(context)!.protein}: ${meal.protein.toStringAsFixed(1)}g',
                                              icon:
                                                  Icons.fitness_center_outlined,
                                            ),
                                            MacroBadge(
                                              text:
                                                  '${AppLocalizations.of(context)!.fat}: ${meal.fat.toStringAsFixed(1)}g',
                                              icon: Icons.water_drop_outlined,
                                            ),
                                            MacroBadge(
                                              text:
                                                  '${AppLocalizations.of(context)!.carbs}: ${meal.carbs.toStringAsFixed(1)}g',
                                              icon: Icons.grain_outlined,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.close),
                                    onPressed: () {
                                      final newList = List<Meal?>.from(
                                        selectedMeals.value,
                                      );
                                      newList[index] = null;
                                      selectedMeals.value = newList;
                                    },
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              height: 80,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Theme.of(
                                  context,
                                ).colorScheme.surfaceContainerHighest,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.outlineVariant,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_circle_outline,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    '${AppLocalizations.of(context)!.selectMeal} ${index + 1}',
                                    style: Theme.of(context).textTheme.bodyLarge
                                        ?.copyWith(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.primary,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),

              // Summary
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.summary,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 12),
                    _buildSummaryRow(
                      context,
                      AppLocalizations.of(context)!.calories,
                      totalCalories.toStringAsFixed(1),
                    ),
                    _buildSummaryRow(
                      context,
                      AppLocalizations.of(context)!.protein,
                      '${totalProtein.toStringAsFixed(1)} g',
                    ),
                    _buildSummaryRow(
                      context,
                      AppLocalizations.of(context)!.fat,
                      '${totalFat.toStringAsFixed(1)} g',
                    ),
                    _buildSummaryRow(
                      context,
                      AppLocalizations.of(context)!.carbs,
                      '${totalCarbs.toStringAsFixed(1)} g',
                    ),
                    const Divider(),
                    _buildSummaryRow(
                      context,
                      AppLocalizations.of(context)!.totalPrice,
                      null,
                      widgetValue: PriceText.fromDouble(
                        priceGroszy: totalPrice,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(),
                      ),
                      isBold: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Save Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : FilledButton(
                        onPressed: saveMealPlan,
                        child: Text(
                          isCustomer
                              ? AppLocalizations.of(context)!.savePlan
                              : AppLocalizations.of(context)!.saveMealPlan,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helpers
  Widget _buildSummaryRow(
    BuildContext context,
    String label,
    String? value, {
    Widget? widgetValue,
    bool isBold = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: isBold ? Theme.of(context).textTheme.bodyMedium : null,
          ),
          if (widgetValue != null)
            widgetValue
          else
            Text(
              value ?? '',
              style: isBold ? Theme.of(context).textTheme.bodyMedium : null,
            ),
        ],
      ),
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
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (imageBytes.value != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.memory(imageBytes.value!, fit: BoxFit.cover),
              )
            else if (currentImageUrl != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
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
}
