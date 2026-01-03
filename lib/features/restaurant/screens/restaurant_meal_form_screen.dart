import 'dart:typed_data';

import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/widgets/global_error_widget.dart';
import 'package:catering_flutter/core/widgets/custom_cached_image.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/widgets/custom_text_field.dart';
import 'package:catering_flutter/features/restaurant/services/meal_service.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:catering_flutter/core/widgets/app_premium_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class RestaurantMealFormScreen extends HookWidget {
  final String? mealId;
  final String restaurantIri;

  const RestaurantMealFormScreen({
    super.key,
    this.mealId,
    required this.restaurantIri,
  });

  @override
  Widget build(BuildContext context) {
    final mealService = context.watch<MealService>();

    // Form and Text Controllers
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final nameController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final priceController = useTextEditingController();
    final caloriesController = useTextEditingController();
    final proteinController = useTextEditingController();
    final fatController = useTextEditingController();
    final carbsController = useTextEditingController();

    // State Hooks
    final imageBytes = useState<Uint8List?>(null);
    final imageName = useState<String?>(null);
    final isSaving = useState(false);

    // Initial Fetch & Sync
    useEffect(() {
      Future.microtask(() async {
        if (mealId != null) {
          await mealService.getMealById(mealId!);
        } else {
          mealService.clearCurrentMeal();
        }
      });
      return null;
    }, [mealId]);

    useEffect(() {
      final meal = mealService.currentMeal;

      if (meal != null) {
        nameController.text = meal.name;
        descriptionController.text = meal.description ?? '';
        priceController.text = (meal.price / 100.0).toStringAsFixed(2);
        caloriesController.text = meal.calories.toString();
        proteinController.text = meal.protein.toString();
        fatController.text = meal.fat.toString();
        carbsController.text = meal.carbs.toString();
      } else if (mealId == null) {
        nameController.clear();
        descriptionController.clear();
        priceController.clear();
        caloriesController.clear();
        proteinController.clear();
        fatController.clear();
        carbsController.clear();
      }
      return null;
    }, [mealService.currentMeal]);

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

    Future<void> saveMeal() async {
      if (!formKey.currentState!.validate()) return;
      isSaving.value = true;

      // Access without watch for callback
      final service = context.read<MealService>();
      bool imageUploadFailed = false;

      try {
        final priceInt = (double.parse(priceController.text) * 100).round();
        final calories = double.tryParse(caloriesController.text);
        final protein = double.tryParse(proteinController.text);
        final fat = double.tryParse(fatController.text);
        final carbs = double.tryParse(carbsController.text);

        String? savedMealIri = mealId;

        if (savedMealIri == null) {
          // Creating new meal
          savedMealIri = await service.createMeal(
            restaurantId: restaurantIri,
            name: nameController.text,
            description: descriptionController.text,
            price: priceInt,
            calories: calories,
            protein: protein,
            fat: fat,
            carbs: carbs,
          );
        } else {
          // Updating existing meal
          await service.updateMeal(
            id: savedMealIri,
            name: nameController.text,
            description: descriptionController.text,
            price: priceInt,
            calories: calories,
            protein: protein,
            fat: fat,
            carbs: carbs,
          );
        }

        // Handle image upload if selected
        if (imageBytes.value != null && savedMealIri != null) {
          try {
            await service.updateMealImage(
              savedMealIri,
              imageBytes.value!,
              imageName.value ?? 'image.jpg',
            );
          } catch (e) {
            imageUploadFailed = true;
          }
        }

        if (context.mounted) {
          final message = imageUploadFailed
              ? AppLocalizations.of(context)!.mealSavedImageFailed
              : AppLocalizations.of(context)!.mealSavedSuccess;

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
            customMessage: AppLocalizations.of(context)!.mealSaveFailed,
          );
        }
      } finally {
        isSaving.value = false;
      }
    }

    final isCreateMode = mealId == null;
    final title = isCreateMode
        ? AppLocalizations.of(context)!.createMeal
        : AppLocalizations.of(context)!.editMeal;

    if (isCreateMode &&
        mealService.currentMeal != null &&
        mealService.isLoading == false) {
      return CustomScaffold(
        title: title,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    if (mealService.hasError && mealService.currentMeal == null) {
      return GlobalErrorWidget(
        message: mealService.errorMessage,
        onRetry: () => mealService.getMealById(mealId!),
        onCancel: () {
          mealService.clearError();
          context.pop();
        },
      );
    }

    if (mealService.isLoading &&
        !isCreateMode &&
        mealService.currentMeal == null) {
      return CustomScaffold(
        title: title,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    final isLoading = mealService.isLoading || isSaving.value;
    final currentMeal = mealService.currentMeal;

    return CustomScaffold(
      title: title,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Section
              _buildImagePicker(
                context,
                imageBytes,
                imageName,
                pickImage,
                isLoading,
                (!isCreateMode && currentMeal != null)
                    ? currentMeal.imageUrl
                    : null,
              ),
              const SizedBox(height: 24),

              // Basic Info
              Text(
                AppLocalizations.of(context)!.basicInformation,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: nameController,
                labelText: AppLocalizations.of(context)!.mealName,
                hintText: AppLocalizations.of(context)!.mealName,
                validator: (v) => v?.isEmpty ?? true
                    ? AppLocalizations.of(context)!.pleaseEnterName
                    : null,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: descriptionController,
                labelText: AppLocalizations.of(context)!.description,
                hintText: AppLocalizations.of(context)!.description,
                maxLines: 3,
                validator: (v) => v?.isEmpty ?? true
                    ? AppLocalizations.of(context)!.pleaseEnterDescription
                    : null,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: priceController,
                labelText: AppLocalizations.of(context)!.price,
                hintText: AppLocalizations.of(context)!.price,
                suffixText: 'PLN',
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return AppLocalizations.of(context)!.pleaseEnterPrice;
                  }
                  if (double.tryParse(v) == null) {
                    return AppLocalizations.of(context)!.pleaseEnterValidNumber;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Nutrition
              Text(
                AppLocalizations.of(context)!.nutritionInformation,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: caloriesController,
                      labelText: AppLocalizations.of(context)!.calories,
                      hintText: AppLocalizations.of(context)!.calories,
                      suffixText: 'kcal',
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomTextField(
                      controller: proteinController,
                      labelText: AppLocalizations.of(context)!.protein,
                      hintText: AppLocalizations.of(context)!.protein,
                      suffixText: 'g',
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: fatController,
                      labelText: AppLocalizations.of(context)!.fat,
                      hintText: AppLocalizations.of(context)!.fat,
                      suffixText: 'g',
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomTextField(
                      controller: carbsController,
                      labelText: AppLocalizations.of(context)!.carbs,
                      hintText: AppLocalizations.of(context)!.carbs,
                      suffixText: 'g',
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              const SizedBox(height: 24),
              AppPremiumButton(
                onPressed: saveMeal,
                label: AppLocalizations.of(context)!.saveMeal,
                isLoading: isLoading,
                icon: Icons.save,
              ),
            ],
          ),
        ),
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
}
