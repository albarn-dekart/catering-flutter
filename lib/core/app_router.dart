import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:catering_flutter/core/app_routes.dart';
import 'package:catering_flutter/features/authentication/services/auth_service.dart';
import 'package:catering_flutter/features/owner/services/restaurant_service.dart';
import 'package:catering_flutter/features/owner/models/meal_plan_model.dart';
import 'package:catering_flutter/features/owner/models/meal_model.dart';

// Import all screens
import 'package:catering_flutter/features/authentication/screens/home_screen.dart';
import 'package:catering_flutter/features/driver/screens/driver_dashboard_screen.dart';
import 'package:catering_flutter/features/owner/screens/restaurant_dashboard_screen.dart';
import 'package:catering_flutter/features/admin/screens/admin_dashboard_screen.dart';
import 'package:catering_flutter/features/authentication/screens/login_screen.dart';
import 'package:catering_flutter/features/authentication/screens/register_screen.dart';
import 'package:catering_flutter/features/owner/screens/manage_restaurant_screen.dart';
import 'package:catering_flutter/features/owner/screens/manage_meal_plans_screen.dart';
import 'package:catering_flutter/features/owner/screens/manage_meals_screen.dart';
import 'package:catering_flutter/features/owner/screens/save_meal_plan_screen.dart';
import 'package:catering_flutter/features/owner/screens/save_meal_screen.dart';
import 'package:catering_flutter/features/admin/screens/create_restaurant_screen.dart';
import 'package:catering_flutter/features/authentication/screens/change_password_screen.dart';
import 'package:catering_flutter/features/customer/screens/receipt_screen.dart';
import 'package:catering_flutter/features/customer/screens/cart_screen.dart';
import 'package:catering_flutter/features/customer/screens/confirm_delivery_screen.dart';
import 'package:catering_flutter/features/owner/screens/restaurants_screen.dart';
import 'package:catering_flutter/features/owner/screens/meal_plans_screen.dart';
import 'package:catering_flutter/features/owner/screens/meal_plan_detail_screen.dart';
import 'package:catering_flutter/features/customer/screens/order_list_screen.dart';
import 'package:catering_flutter/features/customer/screens/profile_screen.dart';
import 'package:catering_flutter/features/owner/screens/manage_deliveries_screen.dart';

class AppRouter {
  final AuthService authService;
  final RestaurantService restaurantService;

  AppRouter({required this.authService, required this.restaurantService});

  late final GoRouter router = GoRouter(
    routes: <RouteBase>[
      ShellRoute(
        builder: (context, state, child) {
          return child;
        },
        routes: [
          GoRoute(
            path: AppRoutes.home,
            builder: (BuildContext context, GoRouterState state) {
              return const HomeScreen();
            },
          ),
          GoRoute(
            path: AppRoutes.driverDashboard,
            builder: (BuildContext context, GoRouterState state) {
              return const DriverDashboardScreen();
            },
          ),
          GoRoute(
            path: AppRoutes.restaurantDashboard,
            builder: (BuildContext context, GoRouterState state) {
              return const RestaurantDashboardScreen();
            },
          ),
          GoRoute(
            path: AppRoutes.adminDashboard,
            builder: (BuildContext context, GoRouterState state) {
              return const AdminDashboardScreen();
            },
          ),
          GoRoute(
            path: AppRoutes.login,
            builder: (BuildContext context, GoRouterState state) {
              return const LoginScreen();
            },
          ),
          GoRoute(
            path: AppRoutes.register,
            builder: (BuildContext context, GoRouterState state) {
              return const RegisterScreen();
            },
          ),
          GoRoute(
            path: AppRoutes.myRestaurant,
            builder: (BuildContext context, GoRouterState state) {
              return const ManageRestaurantScreen();
            },
          ),
          GoRoute(
            path: AppRoutes.editRestaurant,
            builder: (BuildContext context, GoRouterState state) {
              final restaurantId = int.parse(
                state.pathParameters['restaurantId']!,
              );
              return ManageRestaurantScreen(restaurantId: restaurantId);
            },
          ),
          GoRoute(
            path: AppRoutes.manageMealPlans,
            builder: (context, state) {
              return const ManageMealPlansScreen();
            },
          ),
          GoRoute(
            path: AppRoutes.manageMeals,
            builder: (context, state) {
              return const ManageMealsScreen();
            },
          ),
          GoRoute(
            path: AppRoutes.saveMealPlan,
            builder: (context, state) {
              final mealPlan = state.extra as MealPlan?;
              return SaveMealPlanScreen(mealPlan: mealPlan);
            },
          ),
          GoRoute(
            path: AppRoutes.saveMeal,
            builder: (context, state) {
              final meal = state.extra as Meal?;
              return SaveMealScreen(meal: meal);
            },
          ),
          GoRoute(
            path: AppRoutes.createRestaurant,
            builder: (BuildContext context, GoRouterState state) {
              return const CreateRestaurantScreen();
            },
          ),
          GoRoute(
            path: AppRoutes.changePassword,
            builder: (BuildContext context, GoRouterState state) {
              return const ChangePasswordScreen();
            },
          ),
          GoRoute(
            path: AppRoutes.receipt,
            builder: (BuildContext context, GoRouterState state) {
              final orderIdString = state.uri.queryParameters['orderId'];
              if (orderIdString == null) {
                return const Scaffold(
                  body: Center(child: Text('Order ID is missing.')),
                );
              }
              final orderId = int.parse(orderIdString);
              return ReceiptScreen(orderId: orderId);
            },
          ),
          GoRoute(
            path: AppRoutes.cart,
            builder: (BuildContext context, GoRouterState state) {
              return const CartScreen();
            },
          ),
          GoRoute(
            path: AppRoutes.deliveryDetails,
            builder: (BuildContext context, GoRouterState state) {
              return const ConfirmDeliveryScreen();
            },
          ),
          GoRoute(
            path: AppRoutes.restaurants,
            builder: (BuildContext context, GoRouterState state) {
              return const RestaurantsScreen();
            },
          ),
          GoRoute(
            path: AppRoutes.restaurantMealPlans,
            builder: (BuildContext context, GoRouterState state) {
              final restaurantId = int.parse(
                state.pathParameters['restaurantId']!,
              );
              return MealPlansScreen(restaurantId: restaurantId);
            },
          ),
          GoRoute(
            path: AppRoutes.mealPlanDetails,
            builder: (BuildContext context, GoRouterState state) {
              final mealPlanId = int.parse(state.pathParameters['mealPlanId']!);
              return MealPlanDetailScreen(mealPlanId: mealPlanId);
            },
          ),
          GoRoute(
            path: AppRoutes.orders,
            builder: (BuildContext context, GoRouterState state) {
              return const OrderListScreen();
            },
          ),
          GoRoute(
            path: AppRoutes.manageDeliveries,
            builder: (context, state) {
              return const ManageDeliveriesScreen();
            },
          ),
          GoRoute(
            path: AppRoutes.profile,
            builder: (BuildContext context, GoRouterState state) {
              return const ProfileScreen();
            },
          ),
        ],
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) async {
      final loggedIn = await authService.isLoggedIn();
      final loggingIn =
          state.matchedLocation == AppRoutes.login ||
          state.matchedLocation == AppRoutes.register;


      final isPublicRoute =
          state.uri.path == AppRoutes.home ||
          state.uri.path == AppRoutes.restaurants ||
          state.uri.path.startsWith(
            AppRoutes.restaurantMealPlans.split('/:').first,
          ) ||
          state.uri.path.startsWith(
            AppRoutes.mealPlanDetails.split('/:').first,
          );

      if (!loggedIn && !loggingIn && !isPublicRoute) {
        return AppRoutes.login;
      }

      // This is the block that *should* be redirecting based on roles
      if (loggedIn && state.matchedLocation == AppRoutes.home) {
        final userRoles = await authService.getUserRoles();
        String? targetRoute;
        if (userRoles.contains('ROLE_ADMIN')) {
          targetRoute = AppRoutes.adminDashboard;
        } else if (userRoles.contains('ROLE_RESTAURANT')) {
          targetRoute = AppRoutes.restaurantDashboard;
        } else if (userRoles.contains('ROLE_DRIVER')) {
          targetRoute = AppRoutes.driverDashboard;
        }

        if (targetRoute != null && state.matchedLocation != targetRoute) {
          return targetRoute;
        }
        return AppRoutes.home;
      }

      // If logged in and trying to access login/register, redirect to home
      if (loggedIn && loggingIn && state.matchedLocation != AppRoutes.home) {
        return AppRoutes.home;
      }

      return null;
    },
  );
}
