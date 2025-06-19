import 'package:catering_app/Classes/category.dart';
import 'package:flutter/material.dart';
import 'package:catering_app/Classes/meal_plan.dart';
import 'package:catering_app/Classes/meal_selection_widget.dart';
import 'package:catering_app/Classes/meal.dart';
import 'package:catering_app/Classes/catering_app_bar.dart';
import 'package:catering_app/Classes/app_theme.dart';

class MealPlanEditPage extends StatefulWidget {
  final MealPlan? mealPlan;
  final VoidCallback onSaved;

  const MealPlanEditPage({
    super.key,
    this.mealPlan,
    required this.onSaved,
  });

  @override
  State<MealPlanEditPage> createState() => _MealPlanEditPageState();
}

class _MealPlanEditPageState extends State<MealPlanEditPage> {
  late final TextEditingController _nameController;
  late final TextEditingController _descController;
  late final TextEditingController _imageController;
  List<Meal> meals = [];
  List<MealPlan> mealPlans = [];
  List<Category> categories = [];
  Category? selectedCategory;

  MealPlan? selectedMealPlan;
  List<Meal> selectedMeals = [];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.mealPlan?.name ?? '');
    _descController =
        TextEditingController(text: widget.mealPlan?.description ?? '');
    _imageController =
        TextEditingController(text: widget.mealPlan?.imageFile ?? '');
    selectedMeals = widget.mealPlan?.meals.toList() ?? [];
    _getData();
  }

  Future<void> _getData([String? category]) async {
    if (category == null) {
      final mealPlansFuture = MealPlan.get();
      final categoriesFuture = Category.get();

      final results = await Future.wait([mealPlansFuture, categoriesFuture]);
      mealPlans = results[0] as List<MealPlan>;
      categories = results[1] as List<Category>;
    } else {
      meals = await Meal.get(category);
    }

    setState(() {});
  }

  Future<void> _saveMealPlan() async {
    final mealPlan = MealPlan(
      id: widget.mealPlan?.id,
      name: _nameController.text,
      description: _descController.text,
      imageFile: _imageController.text.isEmpty
          ? 'placeholder.png'
          : _imageController.text,
      meals: selectedMeals,
    );

    if (await mealPlan.save()) {
      widget.onSaved();
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CateringAppBar(
          title: widget.mealPlan == null ? 'New Meal Plan' : 'Edit Meal Plan'),
      body: Padding(
        padding: const EdgeInsets.all(AppTheme.defaultPadding),
        child: ListView(
          children: [
            const SizedBox(height: AppTheme.defaultPadding),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Plan Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppTheme.cardRadius),
                ),
              ),
            ),
            const SizedBox(height: AppTheme.defaultPadding),
            TextField(
              controller: _descController,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppTheme.cardRadius),
                ),
              ),
            ),
            const SizedBox(height: AppTheme.defaultPadding),
            TextField(
              controller: _imageController,
              decoration: InputDecoration(
                labelText: 'Image file',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppTheme.cardRadius),
                ),
              ),
            ),
            const SizedBox(height: AppTheme.defaultPadding),
            ElevatedButton(
              onPressed: _saveMealPlan,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.defaultPadding * 2,
                  vertical: 12,
                ),
              ),
              child: const Text(
                'Save Meal Plan',
                style: TextStyle(color: Colors.white70),
              ),
            ),
            const SizedBox(height: AppTheme.defaultPadding),
            MealSelectionWidget(
              categories: categories,
              selectedCategory: selectedCategory,
              availableMeals: meals,
              selectedMeals: selectedMeals,
              onCategoryChanged: (category) {
                _getData(category?.name);
                setState(() => selectedCategory = category);
              },
              onAddToOrder: (meal) {
                setState(() => selectedMeals.add(meal));
              },
              onRemoveFromOrder: (meal) {
                setState(() => selectedMeals.remove(meal));
              },
            ),
          ],
        ),
      ),
    );
  }
}
