import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/features/restaurant/services/meal_plan_service.dart';
import 'package:catering_flutter/features/restaurant/services/meal_service.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/widgets/custom_cached_image.dart';
import 'package:catering_flutter/features/restaurant/screens/restaurant_meal_selection_screen.dart';

class RestaurantMealPlanFormScreen extends StatefulWidget {
  final String? mealPlanId;
  final String restaurantIri;

  const RestaurantMealPlanFormScreen({
    super.key,
    this.mealPlanId,
    required this.restaurantIri,
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
  List<String> _selectedMealIds = [];
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
                      _selectedMealIds = mealPlan.meals!.edges!
                          .map((e) => e?.node?.id)
                          .whereType<String>()
                          .toList();
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

  void _saveMealPlan() async {
    if (_formKey.currentState!.validate()) {
      final mealPlanService = context.read<MealPlanService>();

      try {
        String? mealPlanIri = _savedMealPlanId;

        if (mealPlanIri == null) {
          // Creating new meal plan
          mealPlanIri = await mealPlanService.createMealPlan(
            restaurantIri: widget.restaurantIri,
            name: _nameController.text,
            description: _descriptionController.text,
            mealIds: _selectedMealIds,
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
            mealIds: _selectedMealIds,
          );
        }

        // Handle image upload if selected
        if (_imageFile != null && mealPlanIri != null) {
          try {
            await _uploadImage(mealPlanIri);
          } catch (e) {
            if (mounted) {
              UIErrorHandler.showSnackBar(
                context,
                'Meal Plan saved, but image upload failed. Please retry.',
                isError: true,
                action: SnackBarAction(
                  label: 'Retry Upload',
                  onPressed: () async {
                    try {
                      await _uploadImage(mealPlanIri!);
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
            'Meal Plan saved successfully!',
            isError: false,
          );
          context.pop();
        }
      } catch (e) {
        if (mounted) {
          UIErrorHandler.handleError(
            context,
            e,
            customMessage: 'Failed to save Meal Plan',
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: widget.mealPlanId == null ? 'Create Meal Plan' : 'Edit Meal Plan',
      child: Consumer2<MealPlanService, MealService>(
        builder: (context, mealPlanService, mealService, child) {
          final mealPlan = mealPlanService.currentMealPlan;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image preview
                    if (mealPlan?.imageUrl != null && widget.mealPlanId != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CustomCachedImage(
                          imageUrl: mealPlan!.imageUrl,
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
                        _imageFile == null ? 'Select Image' : 'Change Image',
                      ),
                    ),
                    if (_imageFile != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Selected: ${_imageFile!.name}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    const SizedBox(height: 24),

                    // Name field
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Meal Plan Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Description field
                    TextFormField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),

                    // Meals selection section
                    Text(
                      'Selected Meals',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),

                    if (mealService.isLoading)
                      const Center(child: CircularProgressIndicator())
                    else if (mealService.hasError)
                      Center(
                        child: Column(
                          children: [
                            Text(
                              mealService.errorMessage!,
                              style: const TextStyle(color: Colors.red),
                            ),
                            const SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () => mealService
                                  .fetchMealsByRestaurant(widget.restaurantIri),
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      )
                    else ...[
                      OutlinedButton.icon(
                        onPressed: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  RestaurantMealSelectionScreen(
                                    restaurantIri: widget.restaurantIri,
                                    initiallySelectedIds: _selectedMealIds,
                                  ),
                            ),
                          );

                          if (result != null && result is List<String>) {
                            setState(() {
                              _selectedMealIds = result;
                            });
                          }
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('Add/Remove Meals'),
                      ),
                      const SizedBox(height: 16),
                      if (_selectedMealIds.isEmpty)
                        const Text('No meals selected.')
                      else
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _selectedMealIds.length,
                          itemBuilder: (context, index) {
                            final mealId = _selectedMealIds[index];
                            final meals = mealService.meals
                                .where((m) => m.id == mealId)
                                .toList();

                            if (meals.isEmpty) return const SizedBox.shrink();
                            final meal = meals.first;

                            return Card(
                              margin: const EdgeInsets.only(bottom: 8),
                              child: ListTile(
                                title: Text(meal.name),
                                subtitle: Text(
                                  '${(meal.price / 100.0).toStringAsFixed(2)} PLN',
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    setState(() {
                                      _selectedMealIds.remove(mealId);
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                    ],
                    const SizedBox(height: 24),

                    // Save button
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: mealPlanService.isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : FilledButton(
                              onPressed: _saveMealPlan,
                              child: const Text('Save Meal Plan'),
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
