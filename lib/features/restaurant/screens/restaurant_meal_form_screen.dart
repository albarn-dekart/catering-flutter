import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/features/restaurant/services/meal_service.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/widgets/custom_cached_image.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';

class RestaurantMealFormScreen extends StatefulWidget {
  final String? mealId;
  final String restaurantIri;

  const RestaurantMealFormScreen({
    super.key,
    this.mealId,
    required this.restaurantIri,
  });

  @override
  State<RestaurantMealFormScreen> createState() =>
      _RestaurantMealFormScreenState();
}

class _RestaurantMealFormScreenState extends State<RestaurantMealFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  late TextEditingController _caloriesController;
  late TextEditingController _proteinController;
  late TextEditingController _fatController;
  late TextEditingController _carbsController;
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _priceController = TextEditingController();
    _caloriesController = TextEditingController();
    _proteinController = TextEditingController();
    _fatController = TextEditingController();
    _carbsController = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MealService>().clearStatus();
      if (widget.mealId != null) {
        context.read<MealService>().getMealById(widget.mealId!).then((_) {
          if (mounted) {
            final meal = context.read<MealService>().currentMeal;
            if (meal != null) {
              _nameController.text = meal.name;
              _descriptionController.text = meal.description ?? '';
              _priceController.text = (meal.price / 100.0).toStringAsFixed(2);
              _caloriesController.text = meal.calories.toString();
              _proteinController.text = meal.protein.toString();
              _fatController.text = meal.fat.toString();
              _carbsController.text = meal.carbs.toString();
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
    _priceController.dispose();
    _caloriesController.dispose();
    _proteinController.dispose();
    _fatController.dispose();
    _carbsController.dispose();
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

  Future<void> _uploadImage(String mealIri) async {
    if (_imageFile == null) return;
    final mealService = context.read<MealService>();
    final bytes = await _imageFile!.readAsBytes();
    await mealService.updateMealImage(mealIri, bytes, _imageFile!.name);
  }

  void _saveMeal() async {
    if (_formKey.currentState!.validate()) {
      final mealService = context.read<MealService>();

      try {
        final priceInt = (double.parse(_priceController.text) * 100).round();
        final calories = double.tryParse(_caloriesController.text);
        final protein = double.tryParse(_proteinController.text);
        final fat = double.tryParse(_fatController.text);
        final carbs = double.tryParse(_carbsController.text);

        String? savedMealIri = widget.mealId;

        if (savedMealIri == null) {
          // Creating new meal
          savedMealIri = await mealService.createMeal(
            restaurantId: widget.restaurantIri,
            name: _nameController.text,
            description: _descriptionController.text,
            price: priceInt,
            calories: calories,
            protein: protein,
            fat: fat,
            carbs: carbs,
          );
        } else {
          // Updating existing meal
          await mealService.updateMeal(
            id: savedMealIri,
            name: _nameController.text,
            description: _descriptionController.text,
            price: priceInt,
            calories: calories,
            protein: protein,
            fat: fat,
            carbs: carbs,
          );
        }

        // Handle image upload if selected
        if (_imageFile != null && savedMealIri != null) {
          try {
            await _uploadImage(savedMealIri);
          } catch (e) {
            if (mounted) {
              UIErrorHandler.showSnackBar(
                context,
                AppLocalizations.of(context)!.mealSavedImageFailed,
                isError: true,
                action: SnackBarAction(
                  label: AppLocalizations.of(context)!.retryUpload,
                  onPressed: () async {
                    try {
                      await _uploadImage(savedMealIri!);
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
            AppLocalizations.of(context)!.mealSavedSuccess,
            isError: false,
          );
          context.pop();
        }
      } catch (e) {
        if (mounted) {
          UIErrorHandler.handleError(
            context,
            e,
            customMessage: AppLocalizations.of(context)!.mealSaveFailed,
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: widget.mealId == null
          ? AppLocalizations.of(context)!.createMeal
          : AppLocalizations.of(context)!.editMeal,
      child: Consumer<MealService>(
        builder: (context, mealService, child) {
          final meal = mealService.currentMeal;
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
                    if (meal?.imageUrl != null && widget.mealId != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CustomCachedImage(
                          imageUrl: meal!.imageUrl,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    const SizedBox(height: 16),

                    // Image picker
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

                    // Basic Information Section
                    Text(
                      AppLocalizations.of(context)!.basicInformation,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),

                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.mealName,
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

                    TextFormField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.description,
                        border: const OutlineInputBorder(),
                      ),
                      maxLines: 3,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(
                            context,
                          )!.pleaseEnterDescription;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    TextFormField(
                      controller: _priceController,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.price,
                        border: const OutlineInputBorder(),
                        prefixText: 'PLN ',
                      ),
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!.pleaseEnterPrice;
                        }
                        if (double.tryParse(value) == null) {
                          return AppLocalizations.of(
                            context,
                          )!.pleaseEnterValidNumber;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),

                    // Nutrition Information Section
                    Text(
                      AppLocalizations.of(context)!.nutritionInformation,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),

                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _caloriesController,
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context)!.calories,
                              border: const OutlineInputBorder(),
                              suffixText: 'kcal',
                            ),
                            keyboardType: TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            validator: (value) {
                              if (value != null && value.isNotEmpty) {
                                if (double.tryParse(value) == null) {
                                  return AppLocalizations.of(
                                    context,
                                  )!.invalidNumber;
                                }
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            controller: _proteinController,
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context)!.protein,
                              border: const OutlineInputBorder(),
                              suffixText: 'g',
                            ),
                            keyboardType: TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            validator: (value) {
                              if (value != null && value.isNotEmpty) {
                                if (double.tryParse(value) == null) {
                                  return AppLocalizations.of(
                                    context,
                                  )!.invalidNumber;
                                }
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _fatController,
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context)!.fat,
                              border: const OutlineInputBorder(),
                              suffixText: 'g',
                            ),
                            keyboardType: TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            validator: (value) {
                              if (value != null && value.isNotEmpty) {
                                if (double.tryParse(value) == null) {
                                  return AppLocalizations.of(
                                    context,
                                  )!.invalidNumber;
                                }
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            controller: _carbsController,
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context)!.carbs,
                              border: const OutlineInputBorder(),
                              suffixText: 'g',
                            ),
                            keyboardType: TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            validator: (value) {
                              if (value != null && value.isNotEmpty) {
                                if (double.tryParse(value) == null) {
                                  return AppLocalizations.of(
                                    context,
                                  )!.invalidNumber;
                                }
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Save button
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: mealService.isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : FilledButton(
                              onPressed: _saveMeal,
                              child: Text(
                                AppLocalizations.of(context)!.saveMeal,
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
