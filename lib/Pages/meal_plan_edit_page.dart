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
  List<String> categories = [];
  String? selectedCategory;

  MealPlan? selectedMealPlan;
  List<Meal> selectedMeals = [];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.mealPlan?.name ?? '');
    _descController =
        TextEditingController(text: widget.mealPlan?.description ?? '');
    _imageController =
        TextEditingController(text: widget.mealPlan?.imageUrl ?? '');
    selectedMeals = widget.mealPlan?.meals.toList() ?? [];
    _fetchData();
  }

  Future<void> _fetchData([String? category]) async {
    if (category == null) {
      final mealPlansFuture = MealPlan.fetch();
      final categoriesFuture = Meal.fetchCategories();

      final results = await Future.wait([mealPlansFuture, categoriesFuture]);
      mealPlans = results[0] as List<MealPlan>;
      categories = results[1] as List<String>;
    } else {
      meals = await Meal.fetch(category);
    }

    setState(() {});
  }

  Future<void> _saveMealPlan() async {
    final mealPlan = MealPlan(
      id: widget.mealPlan?.id,
      name: _nameController.text,
      description: _descController.text.isEmpty ? null : _descController.text,
      imageUrl: _imageController.text.isEmpty ? null : _imageController.text,
      meals: selectedMeals,
    );

    await mealPlan.save();
    widget.onSaved();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CateringAppBar(
        title: widget.mealPlan == null ? 'New Meal Plan' : 'Edit Meal Plan',
        showBackButton: true,
      ),
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
                labelText: 'Image URL',
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
                'SAVE MEAL PLAN',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: AppTheme.defaultPadding),
            MealSelectionWidget(
              categories: categories,
              selectedCategory: selectedCategory,
              availableMeals: meals,
              selectedMeals: selectedMeals,
              onCategoryChanged: (category) {
                _fetchData(category);
                setState(() {
                  selectedCategory = category;
                });
              },
              onMealSelected: (meal) {
                setState(() {
                  selectedMeals.add(meal);
                });
              },
              onMealRemoved: (meal) {
                setState(() {
                  selectedMeals.remove(meal);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
