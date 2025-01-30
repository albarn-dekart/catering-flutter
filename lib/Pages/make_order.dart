import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:catering_app/Classes/meal.dart';
import 'package:catering_app/Classes/catering_app_bar.dart';
import 'package:catering_app/Classes/date_range_picker.dart';
import 'package:catering_app/Classes/meal_plan.dart';
import 'package:catering_app/Classes/app_theme.dart';
import 'package:catering_app/Classes/order.dart';
import 'package:catering_app/Classes/meal_selection_widget.dart';

class MakeOrder extends StatefulWidget {
  const MakeOrder({super.key});

  @override
  _MakeOrderState createState() => _MakeOrderState();
}

class _MakeOrderState extends State<MakeOrder> {
  List<Meal> meals = [];
  List<MealPlan> mealPlans = [];
  List<String> categories = [];
  String? selectedCategory;

  MealPlan? selectedMealPlan;
  List<Meal> selectedMeals = [];

  //DateRangePicker
  DateTime? startDate;
  DateTime? endDate;
  late List<int> deliveryDays;

  //Stepper
  int currentStep = 0;
  bool isCustomMealPlan = false;

  void nextStep() {
    if (currentStep == 0 && selectedMeals.isNotEmpty) {
      setState(() {
        currentStep++;
      });
    } else if (currentStep == 1 &&
        startDate != null &&
        endDate != null &&
        deliveryDays.isNotEmpty) {
      setState(() {
        currentStep++;
      });
    }
  }

  void previousStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep--;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    deliveryDays = [1, 2, 3, 4, 5];
    startDate = DateRangePicker.getNextDeliveryDay(
        DateTime.now().add(const Duration(days: 1)), deliveryDays);
    endDate = startDate;

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

  Future<void> _placeOrder() async {
    await Order.placeOrder(selectedMeals, startDate!, endDate!, deliveryDays);
    _resetOrderState();
  }

  void _resetOrderState() {
    setState(() {
      _resetMealSelection();

      deliveryDays = [1, 2, 3, 4, 5];
      startDate = DateRangePicker.getNextDeliveryDay(
          DateTime.now().add(const Duration(days: 1)), deliveryDays);
      endDate = startDate;
      currentStep = 0;
      isCustomMealPlan = false;
    });
  }

  void _resetMealSelection() {
    selectedCategory = null;
    selectedMealPlan = null;
    selectedMeals = [];
    for (var mealPlan in mealPlans) {
      mealPlan.isSelected = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CateringAppBar(title: 'New Order'),
      body: Stepper(
        currentStep: currentStep,
        controlsBuilder: _buildControls,
        steps: [
          _buildStep(
            title: 'Select Meals',
            content: _buildMealSelection(),
            stepIndex: 0,
          ),
          _buildStep(
            title: 'Select Dates',
            content: DateRangePicker(
              onDateSelected: (startDate, endDate, deliveryDays) {
                setState(() {
                  this.startDate = startDate;
                  this.endDate = endDate;
                  this.deliveryDays = deliveryDays;
                });
              },
              startDate: startDate,
              endDate: endDate,
              deliveryDays: deliveryDays,
            ),
            stepIndex: 1,
          ),
          _buildStep(
            title: 'Summary',
            content: _buildSummaryStep(),
            stepIndex: 2,
          ),
        ],
      ),
    );
  }

  Step _buildStep({
    required String title,
    required Widget content,
    required int stepIndex,
  }) {
    return Step(
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      content: content,
      isActive: currentStep == stepIndex,
      state: _getStepState(stepIndex),
    );
  }

  StepState _getStepState(int stepIndex) {
    if (currentStep > stepIndex) return StepState.complete;
    if (currentStep == stepIndex) return StepState.indexed;
    return StepState.disabled;
  }

  Widget _buildControls(BuildContext context, ControlsDetails details) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppTheme.defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (currentStep > 0)
            OutlinedButton(
              onPressed: previousStep, // Updated to use custom method
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.defaultPadding * 1.5, vertical: 12),
                side: const BorderSide(color: AppTheme.primaryColor),
              ),
              child: const Text('BACK'),
            ),
          const Spacer(),
          ElevatedButton(
            onPressed: _getStepValid()
                ? () {
                    if (currentStep < 2) {
                      nextStep(); // Directly call nextStep instead of details.onStepContinue
                    } else {
                      _placeOrder();
                    }
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryColor,
              padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.defaultPadding * 2, vertical: 12),
            ),
            child: Text(
              currentStep < 2 ? 'CONTINUE' : 'PLACE ORDER',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  bool _getStepValid() {
    if (currentStep == 0) return selectedMeals.isNotEmpty;
    if (currentStep == 1) return startDate != null && endDate != null;
    return true;
  }

  Widget _buildMealSelection() {
    return Column(
      children: [
        _buildPlanTypeToggle(),
        const SizedBox(height: AppTheme.defaultPadding),
        isCustomMealPlan
            ? MealSelectionWidget(
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
              )
            : _buildMealPlanSelection(),
      ],
    );
  }

  Widget _buildPlanTypeToggle() {
    return ToggleButtons(
      isSelected: [!isCustomMealPlan, isCustomMealPlan],
      onPressed: (index) {
        setState(() {
          isCustomMealPlan = index == 1;
          _resetMealSelection();
        });
      },
      borderRadius: BorderRadius.circular(AppTheme.cardRadius),
      children: [
        _buildToggleOption('Pre-made Plans', Icons.restaurant_menu),
        _buildToggleOption('Custom Plan', Icons.build),
      ],
    );
  }

  Widget _buildToggleOption(String text, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppTheme.defaultPadding, vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: AppTheme.defaultPadding / 2),
          Text(text),
        ],
      ),
    );
  }

  Widget _buildMealPlanSelection() {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: mealPlans.length,
      separatorBuilder: (_, __) =>
          const SizedBox(height: AppTheme.defaultPadding / 2),
      itemBuilder: (context, index) => MealPlanCard(
          mealPlan: mealPlans[index],
          onSelect: () {
            setState(() {
              mealPlans[index].isSelected = !mealPlans[index].isSelected;
              if (mealPlans[index].isSelected) {
                selectedMealPlan = mealPlans[index];
                // Deselect other mealPlans
                for (var otherMealPlan in mealPlans) {
                  if (otherMealPlan != mealPlans[index]) {
                    otherMealPlan.isSelected = false;
                  }
                }
                selectedMeals = selectedMealPlan!.meals;
              } else {
                _resetMealSelection();
              }
            });
          }),
    );
  }

  Widget _buildSummaryStep() {
    final dateFormat = DateFormat('MMM dd, yyyy');
    final pricePerDay = selectedMealPlan == null
        ? selectedMeals.fold(0.0, (sum, meal) => sum + meal.price)
        : selectedMealPlan!.meals.fold(0.0, (sum, meal) => sum + meal.price);
    final deliveryDaysCount =
        DateRangePicker.countDeliveryDays(startDate, endDate, deliveryDays);
    final totalPrice = pricePerDay * deliveryDaysCount;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order Summary',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: AppTheme.defaultPadding),
            _buildSummaryRow('Meal Plan',
                isCustomMealPlan ? 'Custom' : selectedMealPlan?.name ?? ''),
            _buildSummaryRow('Total Days', deliveryDaysCount.toString()),
            _buildSummaryRow(
                'Daily Price', '\$${pricePerDay.toStringAsFixed(2)}'),
            _buildSummaryRow(
                'Total Price', '\$${totalPrice.toStringAsFixed(2)}'),
            const SizedBox(height: AppTheme.defaultPadding),
            Text('Delivery Dates',
                style: Theme.of(context).textTheme.bodyMedium),
            Text(
              '${dateFormat.format(startDate!)} - ${dateFormat.format(endDate!)}',
              style: const TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: AppTheme.defaultPadding / 2),
            Text('Delivery Days',
                style: Theme.of(context).textTheme.bodyMedium),
            Text(
              deliveryDays
                  .map((d) => DateRangePicker.dayOfWeekToString(d))
                  .join(', '),
              style: const TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: AppTheme.defaultPadding / 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.black54)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
