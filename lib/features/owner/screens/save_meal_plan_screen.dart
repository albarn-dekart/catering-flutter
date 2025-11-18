import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/features/owner/services/meal_plan_service.dart';
import 'package:catering_flutter/features/owner/services/restaurant_service.dart';
import 'package:catering_flutter/features/owner/models/meal_plan_model.dart';
import 'package:catering_flutter/features/owner/models/meal_model.dart';
import 'package:catering_flutter/features/owner/services/meal_service.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart'; // Import CustomScaffold

class SaveMealPlanScreen extends StatefulWidget {
  final MealPlan? mealPlan;

  const SaveMealPlanScreen({super.key, this.mealPlan});

  @override
  State<SaveMealPlanScreen> createState() => _SaveMealPlanScreenState();
}

class _SaveMealPlanScreenState extends State<SaveMealPlanScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;
  List<Meal> _selectedMeals = [];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.mealPlan?.name);
    _descriptionController = TextEditingController(
      text: widget.mealPlan?.description,
    );
    _priceController = TextEditingController(
      text: widget.mealPlan?.price.toString(),
    );
    if (widget.mealPlan != null) {
      _selectedMeals = widget.mealPlan!.meals;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MealPlanService>().clearStatus();
      final restaurantService = context.read<RestaurantService>();
      if (restaurantService.currentRestaurant != null) {
        context.read<MealService>().getMeals(
          restaurantService.currentRestaurant!.id,
        );
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
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

  void _saveMealPlan() async {
    if (_formKey.currentState!.validate()) {
      final mealPlanService = context.read<MealPlanService>();
      final restaurantService = context.read<RestaurantService>();

      final mealPlan = MealPlan(
        id: widget.mealPlan?.id ?? 0,
        name: _nameController.text,
        description: _descriptionController.text,
        price: (double.parse(_priceController.text) * 100).toInt(),
        imageUrl: widget.mealPlan?.imageUrl ?? '',
        restaurant: restaurantService.currentRestaurant!,
        meals: _selectedMeals,
      );

      if (widget.mealPlan == null) {
        await mealPlanService.createMealPlan(
          restaurantId: restaurantService.currentRestaurant!.id,
          mealPlan: mealPlan,
        );
      } else {
        await mealPlanService.updateMealPlan(mealPlan: mealPlan);
      }

      if (mealPlanService.isSuccess) {
        if (_imageFile != null) {
          final imageBytes = await _imageFile!.readAsBytes();
          await mealPlanService.updateMealPlanImage(
            mealPlan.id,
            imageBytes,
            _imageFile!.name,
          );
        }
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Meal Plan saved successfully!')),
          );
          context.pop();
        }
      } else if (mealPlanService.hasError) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Failed to save Meal Plan: ${mealPlanService.errorMessage}',
              ),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Save Meal Plan',
      child: Consumer2<MealPlanService, MealService>(
        builder: (context, mealPlanService, mealService, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    if (widget.mealPlan?.imageUrl != null)
                      Image.network(
                        widget.mealPlan!.imageUrl!,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _pickImage,
                      child: const Text('Change Image'),
                    ),
                    if (_imageFile != null) Text(_imageFile!.name),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: 'Name'),
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
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _priceController,
                      decoration: const InputDecoration(labelText: 'Price'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a price';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    const Text('Meals'),
                    if (mealService.isLoading)
                      const CircularProgressIndicator()
                    else if (mealService.hasError)
                      Text(mealService.errorMessage!)
                    else
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: mealService.meals.length,
                        itemBuilder: (context, index) {
                          final meal = mealService.meals[index];
                          return CheckboxListTile(
                            title: Text(meal.name),
                            value: _selectedMeals.any((m) => m.id == meal.id),
                            onChanged: (bool? value) {
                              setState(() {
                                if (value == true) {
                                  _selectedMeals.add(meal);
                                } else {
                                  _selectedMeals.removeWhere(
                                    (m) => m.id == meal.id,
                                  );
                                }
                              });
                            },
                          );
                        },
                      ),
                    const SizedBox(height: 24),
                    mealPlanService.isLoading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: _saveMealPlan,
                            child: const Text('Save'),
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
