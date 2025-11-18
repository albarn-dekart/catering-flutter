import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/features/owner/services/meal_service.dart';
import 'package:catering_flutter/features/owner/services/restaurant_service.dart';
import 'package:catering_flutter/features/owner/models/meal_model.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart'; // Import CustomScaffold

class SaveMealScreen extends StatefulWidget {
  final Meal? meal;

  const SaveMealScreen({super.key, this.meal});

  @override
  State<SaveMealScreen> createState() => _SaveMealScreenState();
}

class _SaveMealScreenState extends State<SaveMealScreen> {
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
    _nameController = TextEditingController(text: widget.meal?.name);
    _descriptionController = TextEditingController(
      text: widget.meal?.description,
    );
    _priceController = TextEditingController(
      text: widget.meal?.price.toString(),
    );
    _caloriesController = TextEditingController(
      text: widget.meal?.calories.toString(),
    );
    _proteinController = TextEditingController(
      text: widget.meal?.protein.toString(),
    );
    _fatController = TextEditingController(text: widget.meal?.fat.toString());
    _carbsController = TextEditingController(
      text: widget.meal?.carbs.toString(),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MealService>().clearStatus();
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

  void _saveMeal() async {
    if (_formKey.currentState!.validate()) {
      final mealService = context.read<MealService>();
      final restaurantService = context.read<RestaurantService>();

      final meal = Meal(
        id: widget.meal?.id ?? 0,
        name: _nameController.text,
        description: _descriptionController.text,
        price: (double.parse(_priceController.text) * 100).toInt(),
        calories: double.parse(_caloriesController.text),
        protein: double.parse(_proteinController.text),
        fat: double.parse(_fatController.text),
        carbs: double.parse(_carbsController.text),
      );

      if (widget.meal == null) {
        await mealService.createMeal(
          restaurantId: restaurantService.currentRestaurant!.id,
          meal: meal,
        );
      } else {
        await mealService.updateMeal(meal: meal);
      }

      if (mealService.isSuccess) {
        if (_imageFile != null) {
          final imageBytes = await _imageFile!.readAsBytes();
          await mealService.updateMealImage(
            meal.id,
            imageBytes,
            _imageFile!.name,
          );
        }
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Meal saved successfully!')),
          );
          context.pop();
        }
      } else if (mealService.hasError) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to save Meal: ${mealService.errorMessage}'),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Save Meal',
      child: Consumer<MealService>(
        builder: (context, mealService, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    if (widget.meal?.imageUrl != null)
                      Image.network(
                        widget.meal!.imageUrl!,
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
                    TextFormField(
                      controller: _caloriesController,
                      decoration: const InputDecoration(labelText: 'Calories'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter calories';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _proteinController,
                      decoration: const InputDecoration(labelText: 'Protein'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter protein';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _fatController,
                      decoration: const InputDecoration(labelText: 'Fat'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter fat';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _carbsController,
                      decoration: const InputDecoration(labelText: 'Carbs'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter carbs';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    mealService.isLoading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: _saveMeal,
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
