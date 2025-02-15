import 'package:catering_app/Classes/category.dart';
import 'package:flutter/material.dart';

import 'package:catering_app/Classes/meal.dart';
import 'package:catering_app/Classes/catering_app_bar.dart';
import 'package:catering_app/Classes/app_theme.dart';

class MealEditPage extends StatefulWidget {
  final Meal? meal;
  final VoidCallback onSaved;

  const MealEditPage({
    super.key,
    this.meal,
    required this.onSaved,
  });

  @override
  State<MealEditPage> createState() => _MealEditPageState();
}

class _MealEditPageState extends State<MealEditPage> {
  late final TextEditingController _nameController;
  late final TextEditingController _caloriesController;
  late final TextEditingController _proteinController;
  late final TextEditingController _fatController;
  late final TextEditingController _carbsController;
  late final TextEditingController _priceController;

  List<Category> categories = [];
  List<Category> selectedCategories = [];
  Category? newCategory;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _getCategories();
  }

  void _initializeControllers() {
    _nameController = TextEditingController(text: widget.meal?.name ?? '');
    _caloriesController =
        TextEditingController(text: widget.meal?.calories.toString() ?? '');
    _proteinController =
        TextEditingController(text: widget.meal?.protein.toString() ?? '');
    _fatController =
        TextEditingController(text: widget.meal?.fat.toString() ?? '');
    _carbsController =
        TextEditingController(text: widget.meal?.carbs.toString() ?? '');
    _priceController =
        TextEditingController(text: widget.meal?.price.toString() ?? '');
    selectedCategories = widget.meal?.categories.toList() ?? [];
  }

  Future<void> _getCategories() async {
    categories = await Category.get();
    setState(() {});
  }

  Future<void> _saveMeal() async {
    final meal = Meal(
      id: widget.meal?.id,
      name: _nameController.text,
      categories: selectedCategories,
      calories: double.tryParse(_caloriesController.text) ?? 0,
      protein: double.tryParse(_proteinController.text) ?? 0,
      fat: double.tryParse(_fatController.text) ?? 0,
      carbs: double.tryParse(_carbsController.text) ?? 0,
      price: double.tryParse(_priceController.text) ?? 0,
    );

    if (await meal.save()) {
      widget.onSaved();
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CateringAppBar(title: widget.meal == null ? 'New Meal' : 'Edit Meal'),
      body: Padding(
        padding: const EdgeInsets.all(AppTheme.defaultPadding),
        child: ListView(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Meal Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppTheme.cardRadius),
                ),
              ),
            ),
            const SizedBox(height: AppTheme.defaultPadding),
            _buildNutritionInputs(),
            const SizedBox(height: AppTheme.defaultPadding),
            _buildCategorySelector(),
            const SizedBox(height: AppTheme.defaultPadding),
            ElevatedButton(
              onPressed: _saveMeal,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                padding: const EdgeInsets.symmetric(
                    vertical: AppTheme.defaultPadding),
              ),
              child: const Text(
                'Save Meal',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNutritionInputs() {
    return Wrap(
      spacing: AppTheme.defaultPadding,
      runSpacing: AppTheme.defaultPadding,
      children: [
        _buildNutritionField('Calories (kcal)', _caloriesController),
        _buildNutritionField('Protein (g)', _proteinController),
        _buildNutritionField('Fat (g)', _fatController),
        _buildNutritionField('Carbs (g)', _carbsController),
        _buildNutritionField('Price (\$)', _priceController),
      ],
    );
  }

  Widget _buildNutritionField(String label, TextEditingController controller) {
    return SizedBox(
      width: 150,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppTheme.cardRadius),
          ),
        ),
      ),
    );
  }

  Widget _buildCategorySelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Categories:',
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: AppTheme.defaultPadding / 2),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ...selectedCategories.map((category) => Chip(
                  label: Text(category.name),
                  onDeleted: () =>
                      setState(() => selectedCategories.remove(category)),
                )),
          ],
        ),
        const SizedBox(height: AppTheme.defaultPadding / 2),
        DropdownButton<Category>(
            hint: const Text('Add Category'),
            underline: Container(),
            borderRadius: BorderRadius.circular(AppTheme.cardRadius),
            value: newCategory,
            items: categories
                .where((category) =>
                    !selectedCategories.any((selected) => selected == category))
                .map((category) => DropdownMenuItem(
                      value: category,
                      child: Text(category.name),
                    ))
                .toList(),
            onChanged: (category) {
              if (category != null) {
                setState(() {
                  selectedCategories.add(category);
                  newCategory = null;
                });
              }
            }),
      ],
    );
  }
}
