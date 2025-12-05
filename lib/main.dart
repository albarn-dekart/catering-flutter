import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';
import 'core/app_theme.dart';
import 'core/app_router.dart';
import 'core/token_storage_service.dart';
import 'core/graphql_client.dart' as graphql_client;
import 'core/widgets/global_error_widget.dart';
import 'features/order/services/cart_service.dart';
import 'features/order/services/payment_service.dart';
import 'core/auth_service.dart';
import 'features/admin/services/statistics_service.dart';
import 'features/restaurant/services/restaurant_service.dart';
import 'features/user/services/user_service.dart';
import 'features/user/services/address_service.dart';
import 'features/order/services/order_service.dart';
import 'features/driver/services/delivery_service.dart';
import 'features/restaurant/services/meal_service.dart';
import 'features/restaurant/services/meal_plan_service.dart';
import 'features/restaurant/services/restaurant_category_service.dart';
import 'features/restaurant/services/diet_category_service.dart';
import 'features/user/services/home_service.dart';
import 'package:flutter/foundation.dart';
import 'core/api_client.dart';
import 'core/services/media_service.dart';
import 'core/services/export_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Initialize Hive for caching (REQUIRED for graphql_flutter)
  await initHiveForFlutter();

  usePathUrlStrategy();
  GoRouter.optionURLReflectsImperativeAPIs = true;

  // Global Error Handling
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return GlobalErrorWidget(details: details);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    log(
      'Async Error',
      error: error,
      stackTrace: stack,
      name: 'MainErrorHandler',
    );
    return true;
  };

  // 1. Initialize SharedPreferences for cart persistence
  final prefs = await SharedPreferences.getInstance();

  // 2. Initialize TokenStorageService
  final tokenStorageService = TokenStorageService();

  // 3. Initialize AuthService and trigger the asynchronous status check
  final authService = AuthService(tokenStorageService);

  runApp(
    MyApp(
      initialAuthService: authService,
      initialTokenStorage: tokenStorageService,
      initialSharedPreferences: prefs,
    ),
  );
}

class MyApp extends StatefulWidget {
  final AuthService initialAuthService;
  final TokenStorageService initialTokenStorage;
  final SharedPreferences initialSharedPreferences;

  const MyApp({
    super.key,
    required this.initialAuthService,
    required this.initialTokenStorage,
    required this.initialSharedPreferences,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter(widget.initialAuthService);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // 1. Core Services (Use initial instance via .value)
        Provider<TokenStorageService>.value(value: widget.initialTokenStorage),

        // 2. AuthService (Use initial instance via .value)
        ChangeNotifierProvider<AuthService>.value(
          value: widget.initialAuthService,
        ),

        // 3. GraphQLClient (Now depends on AuthService)
        Provider<GraphQLClient>(
          create: (context) =>
              graphql_client.initClient(context.read<AuthService>()),
        ),

        // 3a. ApiClient
        Provider<ApiClient>(
          create: (context) => ApiClient(context.read<AuthService>()),
        ),

        // 3b. MediaService
        Provider<MediaService>(
          create: (context) => MediaService(context.read<ApiClient>()),
        ),

        // 3c. ExportService
        Provider<ExportService>(
          create: (context) => ExportService(context.read<ApiClient>()),
        ),

        // 4. Other Services (Most depend on GraphQLClient/TokenStorageService)
        ChangeNotifierProvider<RestaurantService>(
          create: (context) => RestaurantService(
            context.read<GraphQLClient>(),
            context.read<ApiClient>(),
          ),
        ),
        ChangeNotifierProvider<UserService>(
          create: (context) => UserService(
            context.read<GraphQLClient>(),
            context.read<AuthService>(),
            context.read<ApiClient>(),
          ),
        ),
        ChangeNotifierProvider<AddressService>(
          create: (context) => AddressService(context.read<GraphQLClient>()),
        ),
        ChangeNotifierProvider<OrderService>(
          create: (context) => OrderService(context.read<GraphQLClient>()),
        ),
        ChangeNotifierProvider<DeliveryService>(
          create: (context) => DeliveryService(context.read<GraphQLClient>()),
        ),
        ChangeNotifierProvider<MealService>(
          create: (context) => MealService(
            context.read<GraphQLClient>(),
            context.read<MediaService>(),
          ),
        ),
        ChangeNotifierProvider<MealPlanService>(
          create: (context) => MealPlanService(
            context.read<GraphQLClient>(),
            context.read<ApiClient>(),
          ),
        ),
        ChangeNotifierProvider<RestaurantCategoryService>(
          create: (context) =>
              RestaurantCategoryService(context.read<GraphQLClient>()),
        ),
        ChangeNotifierProvider<DietCategoryService>(
          create: (context) =>
              DietCategoryService(context.read<GraphQLClient>()),
        ),
        ChangeNotifierProxyProvider<AuthService, CartService>(
          create: (context) => CartService(widget.initialSharedPreferences),
          update: (context, auth, cart) {
            if (cart == null) throw ArgumentError.notNull('cart');
            cart.updateAuth(auth);
            return cart;
          },
        ),
        ChangeNotifierProvider<StatisticsService>(
          create: (context) => StatisticsService(context.read<ApiClient>()),
        ),
        ChangeNotifierProvider<PaymentService>(
          create: (context) => PaymentService(context.read<GraphQLClient>()),
        ),
        ChangeNotifierProvider<HomeService>(
          create: (context) => HomeService(context.read<ApiClient>()),
        ),
      ],
      // Since loading is handled in main(), we use MaterialApp.router directly.
      child: MaterialApp.router(
        title: 'Catering App',
        theme: AppTheme.lightTheme,
        routerConfig: _appRouter.router,
      ),
    );
  }
}
