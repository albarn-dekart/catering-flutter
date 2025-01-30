import 'package:flutter/material.dart';
import 'package:catering_app/Classes/role_manager.dart';
import 'package:catering_app/Classes/meal_plan.dart';
import 'package:catering_app/Pages/meal_plan_edit_page.dart';
import 'package:catering_app/Classes/catering_app_bar.dart';
import 'package:catering_app/Classes/app_theme.dart';

class AdminMealPlansPage extends StatefulWidget {
  const AdminMealPlansPage({super.key});

  @override
  State<AdminMealPlansPage> createState() => _AdminMealPlansPageState();
}

class _AdminMealPlansPageState extends State<AdminMealPlansPage> {
  List<MealPlan> mealPlans = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadMealPlans();
  }

  Future<void> _loadMealPlans() async {
    setState(() => isLoading = true);
    mealPlans = await MealPlan.fetch();
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
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: AppTheme.primaryColor,
              ),
            )
          : RefreshIndicator(
              color: AppTheme.primaryColor,
              onRefresh: _loadMealPlans,
              child: Padding(
                padding: const EdgeInsets.all(AppTheme.defaultPadding),
                child: ListView.separated(
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
                    onDelete: (int mealPlanId) {
                      setState(() {
                        mealPlans.removeWhere(
                            (mealPlan) => mealPlan.id == mealPlanId);
                      });
                    },
                    isAdmin: RoleManager().isAdmin,
                  ),
                ),
              ),
            ),
    );
  }
}
