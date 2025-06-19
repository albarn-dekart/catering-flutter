import 'package:catering_app/Classes/user_manager.dart';
import 'package:flutter/material.dart';
import 'package:catering_app/Classes/app_theme.dart';
import 'package:catering_app/Classes/catering_app_bar.dart';
import 'package:catering_app/Classes/meal_plan.dart';
import 'package:catering_app/Pages/login_page.dart';
import 'package:catering_app/Pages/new_order.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MealPlan> mealPlans = [];

  @override
  void initState() {
    super.initState();
    _fetchMealPlans();
  }

  Future<void> _fetchMealPlans() async {
    mealPlans = await MealPlan.get();
    setState(() {});
  }

  void _navigateToNewOrder(MealPlan mealPlan) {
    if (UserManager().hasRole('ROLE_USER')) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NewOrder(initialMealPlan: mealPlan),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: const CateringAppBar(title: 'Home', showBackButton: false),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppTheme.primaryColor.withValues(alpha: 0.8),
              AppTheme.secondaryColor.withValues(alpha: 0.8),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppTheme.defaultPadding),
              child: Text(
                'Meal Plans',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Expanded(
              child: isMobile
                  ? ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppTheme.defaultPadding,
                      ),
                      itemCount: mealPlans.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(
                            bottom: AppTheme.defaultPadding),
                        child: HomeMealPlanCard(
                          mealPlan: mealPlans[index],
                          onSelect: () => _navigateToNewOrder(mealPlans[index]),
                        ),
                      ),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.all(AppTheme.defaultPadding),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: AppTheme.defaultPadding,
                        mainAxisSpacing: AppTheme.defaultPadding,
                        childAspectRatio:
                            1.5, // Adjusted for better proportions
                      ),
                      itemCount: mealPlans.length,
                      itemBuilder: (context, index) => HomeMealPlanCard(
                        mealPlan: mealPlans[index],
                        onSelect: () => _navigateToNewOrder(mealPlans[index]),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
