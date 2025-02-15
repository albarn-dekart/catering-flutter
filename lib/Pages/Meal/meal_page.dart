import 'package:flutter/material.dart';

import 'package:catering_app/Pages/Meal/meal_edit_page.dart';
import 'package:catering_app/Classes/user_manager.dart';
import 'package:catering_app/Classes/meal.dart';
import 'package:catering_app/Classes/catering_app_bar.dart';
import 'package:catering_app/Classes/app_theme.dart';

class MealPage extends StatefulWidget {
  const MealPage({super.key});

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  List<Meal> meals = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadMeals();
  }

  Future<void> _loadMeals() async {
    setState(() => isLoading = true);
    meals = await Meal.get(null);
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CateringAppBar(title: 'Manage Meals'),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MealEditPage(onSaved: _loadMeals),
          ),
        ),
        backgroundColor: AppTheme.primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.cardRadius),
        ),
        child: const Icon(Icons.add),
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    if (isLoading) return const Center(child: CircularProgressIndicator());
    if (meals.isEmpty) return _buildEmptyState();

    return ListView.separated(
      itemCount: meals.length,
      separatorBuilder: (context, index) =>
          const SizedBox(height: AppTheme.defaultPadding),
      itemBuilder: (context, index) => MealCard(
        meal: meals[index],
        onEdit: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MealEditPage(
              meal: meals[index],
              onSaved: _loadMeals,
            ),
          ),
        ),
        onDelete: (Meal meal) {
          setState(() => meals.remove(meal));
        },
        isAdmin: UserManager().hasRole('ROLE_ADMIN'),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.restaurant_rounded, size: 64, color: Colors.grey[400]),
          const SizedBox(height: AppTheme.defaultPadding),
          const Text(
            'No meals found',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
