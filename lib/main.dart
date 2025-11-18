import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'core/config.dart';
import 'core/api_service.dart';
import 'core/app_router.dart';
import 'core/token_storage_service.dart';
import 'features/authentication/services/auth_service.dart';
import 'features/owner/services/restaurant_service.dart';
import 'features/owner/services/meal_plan_service.dart';
import 'features/owner/services/meal_service.dart';
import 'features/customer/services/order_service.dart';
import 'features/customer/services/payment_service.dart';
import 'features/owner/services/category_service.dart';
import 'features/authentication/services/user_service.dart';
import 'features/driver/services/delivery_service.dart';
import 'features/customer/services/profile_api_service.dart';
import 'features/customer/services/profile_service.dart';
import 'features/customer/services/cart_service.dart';
import 'features/authentication/services/change_password_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  GoRouter.optionURLReflectsImperativeAPIs = true;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<TokenStorageService>(create: (_) => TokenStorageService()),
        Provider<ApiService>(
          create: (context) => ApiService(
            baseUrl: AppConfig.baseUrl,
            tokenStorage: context.read<TokenStorageService>(),
          ),
        ),
        ChangeNotifierProvider<AuthService>(
          create: (context) => AuthService(
            apiService: context.read<ApiService>(),
            tokenStorage: context.read<TokenStorageService>(),
          ),
        ),
        ChangeNotifierProvider<RestaurantService>(
          create: (context) => RestaurantService(context.read<ApiService>()),
        ),
        ChangeNotifierProvider<MealPlanService>(
          create: (context) =>
              MealPlanService(apiService: context.read<ApiService>()),
        ),
        ChangeNotifierProvider<MealService>(
          create: (context) =>
              MealService(apiService: context.read<ApiService>()),
        ),
        ChangeNotifierProvider<OrderService>(
          create: (context) => OrderService(
            apiService: context.read<ApiService>(),
            authService: context.read<AuthService>(),
          ),
        ),
        ChangeNotifierProvider<PaymentService>(
          create: (context) =>
              PaymentService(apiService: context.read<ApiService>()),
        ),
        Provider<CategoryService>(
          create: (context) => CategoryService(context.read<ApiService>()),
        ),
        ChangeNotifierProvider<UserService>(
          create: (context) =>
              UserService(apiService: context.read<ApiService>()),
        ),
        ChangeNotifierProvider<DeliveryService>(
          create: (context) =>
              DeliveryService(apiService: context.read<ApiService>()),
        ),
        Provider<ProfileApiService>(
          create: (context) =>
              ProfileApiService(apiService: context.read<ApiService>()),
        ),
        ChangeNotifierProvider<ProfileService>(
          create: (context) => ProfileService(
            authService: context.read<AuthService>(),
            profileApiService: context.read<ProfileApiService>(),
          ),
        ),
        ChangeNotifierProvider<CartService>(create: (context) => CartService()),
        ChangeNotifierProvider<ChangePasswordService>(
          create: (context) => ChangePasswordService(
            apiService: context.read<ApiService>(),
            authService: context.read<AuthService>(),
          ),
        ),
      ],
      child: Builder(
        builder: (context) {
          final appRouter = AppRouter(
            authService: context.read<AuthService>(),
            restaurantService: context.read<RestaurantService>(),
          );

          return MaterialApp.router(
            title: 'Catering App',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
            routerConfig: appRouter.router,
          );
        },
      ),
    );
  }
}
