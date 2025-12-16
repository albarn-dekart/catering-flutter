import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/features/restaurant/services/meal_plan_service.dart';
import 'package:catering_flutter/features/restaurant/services/meal_service.dart';
import 'package:catering_flutter/core/services/auth_service.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/widgets/custom_cached_image.dart';
import 'package:catering_flutter/features/restaurant/screens/restaurant_meals_screen.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';

import 'package:catering_flutter/core/widgets/macro_badge.dart';
import 'package:catering_flutter/core/app_router.dart';
import 'package:catering_flutter/core/widgets/price_text.dart';

class RestaurantMealPlanFormScreen extends StatefulWidget {
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
  State<RestaurantMealPlanFormScreen> createState() =>
      _RestaurantMealPlanFormScreenState();
}

class _RestaurantMealPlanFormScreenState
    extends State<RestaurantMealPlanFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;
  final List<Meal?> _selectedMeals = List.filled(5, null);
  String? _savedMealPlanId; // Track ID after successful save for retry logic

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _savedMealPlanId = widget.mealPlanId;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MealPlanService>().clearStatus();
      context.read<MealService>().fetchMealsByRestaurant(widget.restaurantIri);

      if (widget.mealPlanId != null) {
        context
            .read<MealPlanService>()
            .getMealPlanById(widget.mealPlanId!)
            .then((_) {
              if (mounted) {
                final mealPlan = context
                    .read<MealPlanService>()
                    .currentMealPlan;
                if (mealPlan != null) {
                  _nameController.text = mealPlan.name;
                  _descriptionController.text = mealPlan.description ?? '';
                  if (mealPlan.meals?.edges != null) {
                    setState(() {
                      final edges = mealPlan.meals!.edges!;
                      for (
                        int i = 0;
                        i < edges.length && i < _selectedMeals.length;
                        i++
                      ) {
                        final node = edges[i]?.node;
                        if (node is Meal) {
                          _selectedMeals[i] = node;
                        }
                      }
                    });
                  }
                }
              }
            });
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imageFile = image;
      });
    }
  }

  Future<void> _uploadImage(String mealPlanIri) async {
    try {
      final mealPlanService = context.read<MealPlanService>();
      final bytes = await _imageFile!.readAsBytes();
      await mealPlanService.updateMealPlanImage(
        mealPlanIri,
        bytes,
        _imageFile!.name,
      );
    } catch (e) {
      // Re-throw to be caught by caller
      rethrow;
    }
  }

  double get _totalCalories {
    final selectedMeals = _selectedMeals.whereType<Meal>();
    return selectedMeals.fold<double>(0, (sum, meal) => sum + (meal.calories));
  }

  double get _totalProtein {
    final selectedMeals = _selectedMeals.whereType<Meal>();
    return selectedMeals.fold<double>(0, (sum, meal) => sum + (meal.protein));
  }

  double get _totalFat {
    final selectedMeals = _selectedMeals.whereType<Meal>();
    return selectedMeals.fold<double>(0, (sum, meal) => sum + (meal.fat));
  }

  double get _totalCarbs {
    final selectedMeals = _selectedMeals.whereType<Meal>();
    return selectedMeals.fold<double>(0, (sum, meal) => sum + (meal.carbs));
  }

  double get _totalPrice {
    final selectedMeals = _selectedMeals.whereType<Meal>();
    return selectedMeals.fold<double>(0, (sum, meal) => sum + (meal.price));
  }

  void _saveMealPlan() async {
    if (_formKey.currentState!.validate()) {
      final selectedMealIds = _selectedMeals
          .whereType<Meal>()
          .map((m) => m.id)
          .toList();

      if (selectedMealIds.isEmpty) {
        UIErrorHandler.showSnackBar(
          context,
          AppLocalizations.of(context)!.selectAtLeastOneMeal,
          isError: true,
        );
        return;
      }
      final mealPlanService = context.read<MealPlanService>();
      final authService = context.read<AuthService>();

      try {
        String? mealPlanIri = _savedMealPlanId;

        if (mealPlanIri == null) {
          // Creating new meal plan
          mealPlanIri = await mealPlanService.createMealPlan(
            restaurantIri: widget.restaurantIri,
            name: _nameController.text,
            description: _descriptionController.text,
            mealIds: selectedMealIds,
            ownerIri: widget.isCustomer ? authService.userIri : null,
          );
          setState(() {
            _savedMealPlanId = mealPlanIri;
          });
        } else {
          // Updating existing meal plan
          await mealPlanService.updateMealPlan(
            id: mealPlanIri,
            name: _nameController.text,
            description: _descriptionController.text,
            mealIds: selectedMealIds,
          );
        }

        // Handle image upload if selected
        if (_imageFile != null && mealPlanIri != null && !widget.isCustomer) {
          try {
            await _uploadImage(mealPlanIri);
          } catch (e) {
            if (mounted) {
              UIErrorHandler.showSnackBar(
                context,
                AppLocalizations.of(context)!.mealPlanSavedImageFailed,
                isError: true,
                action: SnackBarAction(
                  label: AppLocalizations.of(context)!.retryUpload,
                  onPressed: () async {
                    try {
                      await _uploadImage(mealPlanIri!);
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
                          AppLocalizations.of(context)!.retryFailed(retryError),
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
            widget.isCustomer
                ? AppLocalizations.of(context)!.mealPlanCreated
                : AppLocalizations.of(context)!.mealPlanSavedSuccess,
            isError: false,
          );
          if (widget.isCustomer) {
            context.go(AppRoutes.myMealPlans);
          } else {
            context.pop();
          }
        }
      } catch (e) {
        if (mounted) {
          UIErrorHandler.handleError(
            context,
            e,
            customMessage: AppLocalizations.of(context)!.mealPlanSaveFailed,
          );
        }
      }
    }
  }

  Widget _buildSummaryRow(
    String label, {
    String? value,
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
            style: isBold
                ? Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)
                : null,
          ),
          if (widgetValue != null)
            widgetValue
          else
            Text(
              value ?? '',
              style: isBold
                  ? Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    )
                  : null,
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String title = widget.mealPlanId == null
        ? AppLocalizations.of(context)!.createMealPlan
        : AppLocalizations.of(context)!.editMealPlan;
    if (widget.isCustomer) {
      title = AppLocalizations.of(context)!.createCustomPlan;
    }

    return CustomScaffold(
      title: title,
      child: Consumer2<MealPlanService, MealService>(
        builder: (context, mealPlanService, mealService, child) {
          final mealPlan = mealPlanService.currentMealPlan;

          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image preview
                    if (!widget.isCustomer &&
                        mealPlan?.imageUrl != null &&
                        widget.mealPlanId != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CustomCachedImage(
                          imageUrl: mealPlan!.imageUrl,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    if (!widget.isCustomer) const SizedBox(height: 16),

                    // Image picker (Hide for customers)
                    if (!widget.isCustomer) ...[
                      OutlinedButton.icon(
                        onPressed: _pickImage,
                        icon: const Icon(Icons.image),
                        label: Text(
                          _imageFile == null
                              ? AppLocalizations.of(context)!.selectImage
                              : AppLocalizations.of(context)!.changeImage,
                        ),
                      ),
                      if (_imageFile != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            '${AppLocalizations.of(context)!.selectedImageLabel} ${_imageFile!.name}',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      const SizedBox(height: 24),
                    ],

                    // Name field
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: widget.isCustomer
                            ? AppLocalizations.of(context)!.planName
                            : AppLocalizations.of(context)!.mealPlanName,
                        border: const OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!.pleaseEnterName;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Description field
                    TextFormField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.description,
                        border: const OutlineInputBorder(),
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 24),

                    // Meals selection section
                    Text(
                      AppLocalizations.of(context)!.selectedMeals,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final meal = _selectedMeals[index];
                        final isSelected = meal != null;

                        return InkWell(
                          onTap: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RestaurantMealsScreen(
                                  restaurantIri: widget.restaurantIri,
                                  isSelectionMode: true,
                                ),
                              ),
                            );

                            if (result != null && result is Meal) {
                              setState(() {
                                _selectedMeals[index] = result;
                              });
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
                                    color: Colors.black.withValues(alpha: 0.05),
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
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
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
                                              Text(
                                                meal.name,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium
                                                    ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
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
                                                        '${AppLocalizations.of(context)!.protein}: ${meal.protein.toStringAsFixed(0)}g',
                                                    icon: Icons
                                                        .fitness_center_outlined,
                                                  ),
                                                  MacroBadge(
                                                    text:
                                                        '${AppLocalizations.of(context)!.fat}: ${meal.fat.toStringAsFixed(0)}g',
                                                    icon: Icons
                                                        .water_drop_outlined,
                                                  ),
                                                  MacroBadge(
                                                    text:
                                                        '${AppLocalizations.of(context)!.carbs}: ${meal.carbs.toStringAsFixed(0)}g',
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
                                            setState(() {
                                              _selectedMeals[index] = null;
                                            });
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
                                        width: 1,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                color: Theme.of(
                                                  context,
                                                ).colorScheme.primary,
                                                fontWeight: FontWeight.bold,
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

                    // Summary Section
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
                            AppLocalizations.of(context)!.calories,
                            value:
                                '${AppLocalizations.of(context)!.calories}: ${_totalCalories.toStringAsFixed(1)}',
                          ),
                          _buildSummaryRow(
                            AppLocalizations.of(context)!.protein,
                            value: '${_totalProtein.toStringAsFixed(1)} g',
                          ),
                          _buildSummaryRow(
                            AppLocalizations.of(context)!.fat,
                            value: '${_totalFat.toStringAsFixed(1)} g',
                          ),
                          _buildSummaryRow(
                            AppLocalizations.of(context)!.carbs,
                            value: '${_totalCarbs.toStringAsFixed(1)} g',
                          ),
                          const Divider(),
                          _buildSummaryRow(
                            AppLocalizations.of(context)!.totalPrice,
                            widgetValue: PriceText.fromDouble(
                              priceGroszy: _totalPrice,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            isBold: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Save button
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: mealPlanService.isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : FilledButton(
                              onPressed: _saveMealPlan,
                              child: Text(
                                widget.isCustomer
                                    ? AppLocalizations.of(context)!.savePlan
                                    : AppLocalizations.of(
                                        context,
                                      )!.saveMealPlan,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
