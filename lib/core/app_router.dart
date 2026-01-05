import 'package:catering_flutter/core/services/auth_service.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/core/widgets/global_error_widget.dart';
import 'package:catering_flutter/features/restaurant/screens/restaurant_meal_plan_form_screen.dart';
import 'package:catering_flutter/features/restaurant/services/meal_service.dart';
import 'package:catering_flutter/features/restaurant/services/meal_plan_service.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:catering_flutter/features/courier/screens/courier_dashboard_screen.dart';
import 'package:catering_flutter/features/restaurant/screens/restaurant_dashboard_screen.dart';
import 'package:catering_flutter/features/admin/screens/admin_dashboard_screen.dart';
import 'package:catering_flutter/features/user/screens/login_screen.dart';
import 'package:catering_flutter/features/user/screens/register_screen.dart';
import 'package:catering_flutter/features/restaurant/screens/restaurant_form_screen.dart';
import 'package:catering_flutter/features/restaurant/screens/restaurant_meal_plans_screen.dart';
import 'package:catering_flutter/features/restaurant/screens/restaurant_meals_screen.dart';
import 'package:catering_flutter/features/restaurant/screens/restaurant_meal_form_screen.dart';
import 'package:catering_flutter/features/user/screens/change_password_screen.dart';
import 'package:catering_flutter/features/order/screens/cart_screen.dart';
import 'package:catering_flutter/features/order/screens/confirm_order_screen.dart';
import 'package:catering_flutter/features/restaurant/screens/restaurants_screen.dart';
import 'package:catering_flutter/features/restaurant/screens/meal_plans_by_restaurant_screen.dart';

import 'package:catering_flutter/features/restaurant/screens/meal_plan_detail_screen.dart';
import 'package:catering_flutter/features/order/screens/order_list_screen.dart';
import 'package:catering_flutter/features/restaurant/screens/restaurant_deliveries_screen.dart';

import 'package:catering_flutter/features/restaurant/screens/restaurant_couriers_screen.dart';
import 'package:catering_flutter/features/restaurant/screens/restaurant_production_screen.dart';
import 'package:catering_flutter/features/order/screens/order_detail_screen.dart';
import 'package:catering_flutter/features/customer/screens/address_list_screen.dart';
import 'package:catering_flutter/features/customer/screens/address_form_screen.dart';
import 'package:catering_flutter/features/customer/services/address_service.dart';
import 'package:catering_flutter/features/user/screens/profile_screen.dart';
import 'package:catering_flutter/features/customer/screens/customer_home_screen.dart';
import 'package:catering_flutter/features/order/services/order_service.dart';
import 'package:catering_flutter/features/customer/screens/customer_meal_plans_screen.dart';

import 'package:catering_flutter/features/admin/screens/admin_restaurants_screen.dart';
import 'package:catering_flutter/features/admin/screens/admin_users_screen.dart';
import 'package:catering_flutter/features/admin/screens/admin_restaurant_categories_screen.dart';
import 'package:catering_flutter/features/admin/screens/admin_diet_categories_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String changePassword = '/change-password';

  //Customer
  static const String profile = '/profile';
  static const String restaurants = '/restaurants';
  static const String mealPlansByRestaurant = '/meal-plans';
  static const String customMealPlanBuilder = '/meal-plan/custom/build';
  static const String mealPlanDetails = '/meal-plan';
  static const String cart = '/cart';
  static const String orders = '/orders';
  static const String orderDetail = '/order';
  static const String receipt = '/user/receipt';
  static const String orderConfirm = '/order-confirm';
  static const String addressList = '/addresses';
  static const String myMealPlans = '/my-meal-plans';
  static const String addressForm = '/address-form';

  //Admin
  static const String adminDashboard = '/admin/dashboard';
  static const String adminRestaurants = '/admin/restaurants';
  static const String adminRestaurantCreate = '/admin/restaurant/create';
  static const String adminUsers = '/admin/users';
  static const String adminRestaurantCategories =
      '/admin/categories/restaurant';
  static const String adminDietCategories = '/admin/categories/diet';

  //Restaurant
  static const String restaurantDashboard = '/restaurant/dashboard';

  static const String restaurantOrders = '/restaurant/orders';
  static const String restaurantDeliveries = '/restaurant/deliveries';
  static const String restaurantCouriers = '/restaurant/couriers';
  static const String restaurantForm = '/restaurant/edit';
  static const String restaurantMealPlans = '/restaurant/meal-plans';
  static const String restaurantMeals = '/restaurant/meals';
  static const String restaurantMealForm = '/restaurant/meal';
  static const String restaurantMealPlanForm = '/restaurant/meal-plan';
  static const String restaurantProduction = '/restaurant/production';

  //Courier
  static const String courierDashboard = '/courier/dashboard';
}

class AppRouter {
  final AuthService authService;

  AppRouter(this.authService);

  late final GoRouter router = GoRouter(
    refreshListenable: authService,
    errorBuilder: (context, state) {
      return GlobalErrorWidget(
        withScaffold: true,
        details: FlutterErrorDetails(
          exception: state.error ?? Exception('Unknown Router Error'),
          library: 'GoRouter',
        ),
      );
    },
    routes: <RouteBase>[
      ShellRoute(
        builder: (context, state, child) {
          return child;
        },
        routes: [
          GoRoute(
            path: AppRoutes.home,
            builder: (BuildContext context, GoRouterState state) {
              return const CustomerHomeScreen();
            },
          ),
          GoRoute(
            path: AppRoutes.restaurants,
            builder: (BuildContext context, GoRouterState state) {
              final intent = state.uri.queryParameters['intent'];
              return RestaurantsScreen(
                selectForMealPlan: intent == 'build_meal_plan',
              );
            },
          ),
          GoRoute(
            path: AppRoutes.courierDashboard,
            builder: (BuildContext context, GoRouterState state) {
              return const CourierDashboardScreen();
            },
          ),
          GoRoute(
            path: AppRoutes.restaurantDashboard,
            builder: (BuildContext context, GoRouterState state) {
              final restaurantId = state.uri.queryParameters['id'];
              final restaurantIri = restaurantId != null
                  ? IriHelper.buildIri('restaurants', restaurantId)
                  : null;
              return RestaurantDashboardScreen(restaurantIri: restaurantIri);
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
              final redirect = state.uri.queryParameters['redirect'];
              return LoginScreen(redirectUrl: redirect);
            },
          ),
          GoRoute(
            path: AppRoutes.register,
            builder: (BuildContext context, GoRouterState state) {
              return const RegisterScreen();
            },
          ),
          GoRoute(
            path: AppRoutes.restaurantForm,
            builder: (BuildContext context, GoRouterState state) {
              final restaurantIri = IriHelper.buildIri(
                'restaurants',
                state.uri.queryParameters['id']!,
              );
              return RestaurantFormScreen(restaurantIri: restaurantIri);
            },
          ),
          GoRoute(
            path: AppRoutes.restaurantMealPlans,
            builder: (context, state) {
              final restaurantIri = IriHelper.buildIri(
                'restaurants',
                state.uri.queryParameters['restaurantId']!,
              );
              return RestaurantMealPlansScreen(restaurantIri: restaurantIri);
            },
          ),
          GoRoute(
            path: AppRoutes.restaurantMeals,
            builder: (context, state) {
              final restaurantIri = IriHelper.buildIri(
                'restaurants',
                state.uri.queryParameters['restaurantId']!,
              );
              return RestaurantMealsScreen(restaurantIri: restaurantIri);
            },
          ),
          GoRoute(
            path: AppRoutes.restaurantMealPlanForm,
            builder: (context, state) {
              final restaurantIri = IriHelper.buildIri(
                'restaurants',
                state.uri.queryParameters['restaurantId']!,
              );
              final mealPlanNode = state.extra is MealPlan
                  ? state.extra as MealPlan
                  : null;
              return RestaurantMealPlanFormScreen(
                mealPlanId: mealPlanNode?.id,
                restaurantIri: restaurantIri,
              );
            },
          ),
          GoRoute(
            path: AppRoutes.restaurantMealForm,
            builder: (context, state) {
              final restaurantIri = IriHelper.buildIri(
                'restaurants',
                state.uri.queryParameters['restaurantId']!,
              );
              final mealNode = state.extra is Meal ? state.extra as Meal : null;
              return RestaurantMealFormScreen(
                mealId: mealNode?.id,
                restaurantIri: restaurantIri,
              );
            },
          ),
          GoRoute(
            path: AppRoutes.adminRestaurantCreate,
            builder: (BuildContext context, GoRouterState state) {
              return const RestaurantFormScreen();
            },
          ),
          GoRoute(
            path: AppRoutes.changePassword,
            builder: (BuildContext context, GoRouterState state) {
              return const ChangePasswordScreen();
            },
          ),
          GoRoute(
            path: AppRoutes.cart,
            builder: (BuildContext context, GoRouterState state) {
              return const CartScreen();
            },
          ),
          GoRoute(
            path: AppRoutes.orderConfirm,
            builder: (BuildContext context, GoRouterState state) {
              return const ConfirmOrderScreen();
            },
          ),
          GoRoute(
            path: AppRoutes.mealPlansByRestaurant,
            builder: (BuildContext context, GoRouterState state) {
              final restaurantIri = IriHelper.buildIri(
                'restaurants',
                state.uri.queryParameters['restaurantId']!,
              );
              return MealPlansByRestaurant(restaurantIri: restaurantIri);
            },
          ),
          GoRoute(
            path: AppRoutes.customMealPlanBuilder,
            builder: (context, state) {
              final restaurantIri = IriHelper.buildIri(
                'restaurants',
                state.uri.queryParameters['restaurantId']!,
              );
              final mealPlanNode = state.extra is MealPlan
                  ? state.extra as MealPlan
                  : null;
              return RestaurantMealPlanFormScreen(
                mealPlanId: mealPlanNode?.id,
                restaurantIri: restaurantIri,
                isCustomer: true,
              );
            },
          ),
          GoRoute(
            path: AppRoutes.mealPlanDetails,
            builder: (BuildContext context, GoRouterState state) {
              final mealPlanIri = IriHelper.buildIri(
                'meal_plans',
                state.uri.queryParameters['id']!,
              );
              return MealPlanDetailScreen(mealPlanIri: mealPlanIri);
            },
          ),
          GoRoute(
            path: AppRoutes.orders,
            builder: (BuildContext context, GoRouterState state) {
              return const OrderListScreen();
            },
          ),
          GoRoute(
            path: AppRoutes.restaurantDeliveries,
            builder: (context, state) {
              final restaurantIri = IriHelper.buildIri(
                'restaurants',
                state.uri.queryParameters['restaurantId']!,
              );
              return RestaurantDeliveriesScreen(restaurantIri: restaurantIri);
            },
          ),
          GoRoute(
            path: AppRoutes.restaurantOrders,
            builder: (context, state) {
              final restaurantIri = IriHelper.buildIri(
                'restaurants',
                state.uri.queryParameters['restaurantId']!,
              );
              return OrderListScreen(restaurantIri: restaurantIri);
            },
          ),

          GoRoute(
            path: AppRoutes.restaurantCouriers,
            builder: (context, state) {
              final restaurantIri = IriHelper.buildIri(
                'restaurants',
                state.uri.queryParameters['restaurantId']!,
              );
              return RestaurantCouriersScreen(restaurantIri: restaurantIri);
            },
          ),
          GoRoute(
            path: AppRoutes.restaurantProduction,
            builder: (context, state) {
              final restaurantId = state.uri.queryParameters['restaurantId']!;
              return RestaurantProductionScreen(restaurantId: restaurantId);
            },
          ),
          GoRoute(
            path: AppRoutes.orderDetail,
            builder: (BuildContext context, GoRouterState state) {
              final orderIri = IriHelper.buildIri(
                'orders',
                state.uri.queryParameters['id']!,
              );
              // Extract the order data if passed via extra
              final orderData = state.extra is OrderDetails
                  ? state.extra as OrderDetails
                  : null;
              return OrderDetailScreen(
                orderIri: orderIri,
                initialOrderData: orderData,
              );
            },
          ),
          GoRoute(
            path: AppRoutes.addressList,
            builder: (BuildContext context, GoRouterState state) {
              final isSelectionMode =
                  state.uri.queryParameters['selection'] == 'true';
              return AddressListScreen(isSelectionMode: isSelectionMode);
            },
          ),
          GoRoute(
            path: AppRoutes.addressForm,
            builder: (BuildContext context, GoRouterState state) {
              final address = state.extra is Address
                  ? state.extra as Address
                  : null;
              return AddressFormScreen(address: address);
            },
          ),
          GoRoute(
            path: AppRoutes.profile,
            builder: (BuildContext context, GoRouterState state) {
              return const ProfileScreen();
            },
          ),
          GoRoute(
            path: AppRoutes.myMealPlans,
            builder: (BuildContext context, GoRouterState state) {
              return const CustomerMealPlansScreen();
            },
          ),

          GoRoute(
            path: AppRoutes.adminRestaurants,
            builder: (BuildContext context, GoRouterState state) {
              return const AdminRestaurantsScreen();
            },
          ),
          GoRoute(
            path: AppRoutes.adminUsers,
            builder: (BuildContext context, GoRouterState state) {
              return const AdminUsersScreen();
            },
          ),
          GoRoute(
            path: AppRoutes.adminRestaurantCategories,
            builder: (BuildContext context, GoRouterState state) {
              return const AdminRestaurantCategoriesScreen();
            },
          ),
          GoRoute(
            path: AppRoutes.adminDietCategories,
            builder: (BuildContext context, GoRouterState state) {
              return const AdminDietCategoriesScreen();
            },
          ),
        ],
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) {
      final loggedIn = authService.isAuthenticated;
      final location = state.matchedLocation;
      final requestedPath = state.uri.path;

      const publicRoutes = {
        AppRoutes.home,
        AppRoutes.restaurants,
        AppRoutes.login,
        AppRoutes.register,
        AppRoutes.mealPlansByRestaurant,
        AppRoutes.mealPlanDetails,
      };
      final isPublic = publicRoutes.contains(location);

      if (!loggedIn && !isPublic) {
        return AppRoutes.login;
      }

      if (loggedIn &&
          (location == AppRoutes.login || location == AppRoutes.register)) {
        if (!isPublic) {
          return requestedPath;
        }
        return AppRoutes.home;
      }

      if (loggedIn && location == AppRoutes.home) {
        if (requestedPath != AppRoutes.home) {
          if (!publicRoutes.contains(requestedPath)) {
            return requestedPath;
          }
        }

        String? targetRoute;

        if (authService.hasRole('ROLE_ADMIN')) {
          targetRoute = AppRoutes.adminDashboard;
        } else if (authService.hasRole('ROLE_RESTAURANT')) {
          targetRoute = AppRoutes.restaurantDashboard;
        } else if (authService.hasRole('ROLE_COURIER')) {
          targetRoute = AppRoutes.courierDashboard;
        }

        if (targetRoute != null) {
          return targetRoute;
        }
      }

      return null;
    },
  );
}
