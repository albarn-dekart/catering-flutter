import 'package:catering_flutter/core/auth_service.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/core/widgets/global_error_widget.dart';
import 'package:catering_flutter/features/restaurant/services/meal_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:catering_flutter/core/app_routes.dart';
import 'package:catering_flutter/features/driver/screens/driver_dashboard_screen.dart';
import 'package:catering_flutter/features/restaurant/screens/restaurant_dashboard_screen.dart';
import 'package:catering_flutter/features/admin/screens/admin_dashboard_screen.dart';
import 'package:catering_flutter/features/user/screens/login_screen.dart';
import 'package:catering_flutter/features/user/screens/register_screen.dart';
import 'package:catering_flutter/features/restaurant/screens/restaurant_form_screen.dart';
import 'package:catering_flutter/features/restaurant/screens/manage_meal_plans_screen.dart';
import 'package:catering_flutter/features/restaurant/screens/manage_meals_screen.dart';
import 'package:catering_flutter/features/restaurant/screens/meal_form_screen.dart';
import 'package:catering_flutter/features/user/screens/change_password_screen.dart';
import 'package:catering_flutter/features/order/screens/cart_screen.dart';
import 'package:catering_flutter/features/order/screens/confirm_order_screen.dart';
import 'package:catering_flutter/features/restaurant/screens/restaurants_screen.dart';
import 'package:catering_flutter/features/restaurant/screens/meal_plans_screen.dart';
import 'package:catering_flutter/features/restaurant/screens/meal_plan_detail_screen.dart';
import 'package:catering_flutter/features/order/screens/order_list_screen.dart';
import 'package:catering_flutter/features/restaurant/screens/manage_deliveries_screen.dart';
import 'package:catering_flutter/features/restaurant/screens/manage_orders_screen.dart';
import 'package:catering_flutter/features/restaurant/screens/manage_categories_screen.dart';
import 'package:catering_flutter/features/restaurant/screens/manage_drivers_screen.dart';
import 'package:catering_flutter/features/order/screens/order_detail_screen.dart';
import 'package:catering_flutter/features/user/screens/address_list_screen.dart';
import 'package:catering_flutter/features/user/screens/address_form_screen.dart';
import 'package:catering_flutter/features/user/services/address_service.dart';
import 'package:catering_flutter/features/user/screens/customer_dashboard_screen.dart';
import 'package:catering_flutter/features/order/services/order_service.dart';

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
              return const RestaurantsScreen();
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
            path: AppRoutes.manageMealPlans,
            builder: (context, state) {
              final restaurantIri = IriHelper.buildIri(
                'restaurants',
                state.uri.queryParameters['restaurantId']!,
              );
              return ManageMealPlansScreen(restaurantIri: restaurantIri);
            },
          ),
          GoRoute(
            path: AppRoutes.manageMeals,
            builder: (context, state) {
              final restaurantIri = IriHelper.buildIri(
                'restaurants',
                state.uri.queryParameters['restaurantId']!,
              );
              return ManageMealsScreen(restaurantIri: restaurantIri);
            },
          ),
          GoRoute(
            path: AppRoutes.mealForm,
            builder: (context, state) {
              final restaurantIri = IriHelper.buildIri(
                'restaurants',
                state.uri.queryParameters['restaurantId']!,
              );
              final mealNode = state.extra as Meal?;
              return MealFormScreen(
                mealId: mealNode?.id,
                restaurantIri: restaurantIri,
              );
            },
          ),
          GoRoute(
            path: AppRoutes.createRestaurant,
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
            path: AppRoutes.restaurantMealPlans,
            builder: (BuildContext context, GoRouterState state) {
              final restaurantIri = IriHelper.buildIri(
                'restaurants',
                state.uri.queryParameters['restaurantId']!,
              );
              return MealPlansScreen(restaurantIri: restaurantIri);
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
            path: AppRoutes.manageDeliveries,
            builder: (context, state) {
              final restaurantIri = IriHelper.buildIri(
                'restaurants',
                state.uri.queryParameters['restaurantId']!,
              );
              return ManageDeliveriesScreen(restaurantIri: restaurantIri);
            },
          ),
          GoRoute(
            path: AppRoutes.manageOrders,
            builder: (context, state) {
              final restaurantIri = IriHelper.buildIri(
                'restaurants',
                state.uri.queryParameters['restaurantId']!,
              );
              return ManageOrdersScreen(restaurantIri: restaurantIri);
            },
          ),
          GoRoute(
            path: AppRoutes.manageCategories,
            builder: (context, state) {
              final restaurantIri = IriHelper.buildIri(
                'restaurants',
                state.uri.queryParameters['restaurantId']!,
              );
              return ManageCategoriesScreen(restaurantIri: restaurantIri);
            },
          ),
          GoRoute(
            path: AppRoutes.manageDrivers,
            builder: (context, state) {
              final restaurantIri = IriHelper.buildIri(
                'restaurants',
                state.uri.queryParameters['restaurantId']!,
              );
              return ManageDriversScreen(restaurantIri: restaurantIri);
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
              final orderData = state.extra as CreatedOrder?;
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
              final address = state.extra as Address?;
              return AddressFormScreen(address: address);
            },
          ),
          GoRoute(
            path: AppRoutes.customerDashboard,
            builder: (BuildContext context, GoRouterState state) {
              return const CustomerDashboardScreen();
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
        AppRoutes.login,
        AppRoutes.register,
        AppRoutes.restaurantMealPlans,
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
        } else if (authService.hasRole('ROLE_DRIVER')) {
          targetRoute = AppRoutes.driverDashboard;
        }

        if (targetRoute != null) {
          return targetRoute;
        }
      }

      return null;
    },
  );
}
