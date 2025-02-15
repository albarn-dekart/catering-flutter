import 'package:flutter/material.dart';
import 'package:catering_app/Classes/user_manager.dart';
import 'package:catering_app/Classes/meal_plan.dart';
import 'package:catering_app/Pages/Meal/meal_plan_edit_page.dart';
import 'package:catering_app/Classes/catering_app_bar.dart';
import 'package:catering_app/Classes/app_theme.dart';

class MealPlanPage extends StatefulWidget {
  const MealPlanPage({super.key});

  @override
  State<MealPlanPage> createState() => _MealPlanPageState();
}

class _MealPlanPageState extends State<MealPlanPage> {
  List<MealPlan> mealPlans = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadMealPlans();
  }

  Future<void> _loadMealPlans() async {
    setState(() => isLoading = true);
    mealPlans = await MealPlan.get();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CateringAppBar(title: 'Manage Meal Plans'),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MealPlanEditPage(
              onSaved: _loadMealPlans,
            ),
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
    if (mealPlans.isEmpty) return _buildEmptyState();

    return ListView.separated(
      itemCount: mealPlans.length,
      separatorBuilder: (context, index) =>
          const SizedBox(height: AppTheme.defaultPadding),
      itemBuilder: (context, index) => MealPlanCard(
        mealPlan: mealPlans[index],
        onEdit: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MealPlanEditPage(
              mealPlan: mealPlans[index],
              onSaved: _loadMealPlans,
            ),
          ),
        ),
        onDelete: (MealPlan mealPlan) {
          setState(() => mealPlans.remove(mealPlan));
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
          Icon(Icons.calendar_month_rounded, size: 64, color: Colors.grey[400]),
          const SizedBox(height: AppTheme.defaultPadding),
          const Text(
            'No meal plans found',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
