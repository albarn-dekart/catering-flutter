import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'core/providers/language_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';
import 'core/app_theme.dart';
import 'core/app_router.dart';
import 'core/services/token_storage_service.dart';
import 'core/services/graphql_service.dart' as graphql_client;
import 'core/widgets/global_error_widget.dart';
import 'features/order/services/cart_service.dart';
import 'features/order/services/payment_service.dart';
import 'core/services/auth_service.dart';
import 'features/admin/services/statistics_service.dart';
import 'features/restaurant/services/restaurant_service.dart';
import 'features/user/services/user_service.dart';
import 'features/customer/services/address_service.dart';
import 'features/order/services/order_service.dart';
import 'features/courier/services/delivery_service.dart';
import 'features/restaurant/services/meal_service.dart';
import 'features/restaurant/services/meal_plan_service.dart';
import 'features/restaurant/services/restaurant_category_service.dart';
import 'features/restaurant/services/diet_category_service.dart';
import 'features/restaurant/services/production_service.dart';
import 'features/customer/services/home_service.dart';
import 'package:flutter/foundation.dart';
import 'dart:ui' as ui;
import 'core/services/api_service.dart';
import 'core/services/media_service.dart';
import 'core/services/export_service.dart';

/// Custom scroll behavior that shows scrollbars on desktop/web platforms
/// while maintaining drag-to-scroll support for all pointer types.
class AppScrollBehavior extends MaterialScrollBehavior {
  const AppScrollBehavior();

  @override
  Set<ui.PointerDeviceKind> get dragDevices => {
    ui.PointerDeviceKind.mouse,
    ui.PointerDeviceKind.touch,
    ui.PointerDeviceKind.trackpad,
    ui.PointerDeviceKind.stylus,
  };

  @override
  Widget buildScrollbar(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    // On desktop/web, show scrollbars automatically
    switch (Theme.of(context).platform) {
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        return Scrollbar(
          controller: details.controller,
          thumbVisibility: false, // Only show on hover/interaction
          child: child,
        );
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.iOS:
        // On mobile platforms, use default behavior (scrollbars appear during scroll)
        return child;
    }
  }
}

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
        Provider<ApiService>(
          create: (context) => ApiService(context.read<AuthService>()),
        ),

        // 3b. MediaService
        Provider<MediaService>(
          create: (context) => MediaService(context.read<ApiService>()),
        ),

        // 3c. ExportService
        Provider<ExportService>(
          create: (context) => ExportService(context.read<ApiService>()),
        ),

        // 4. Other Services (Most depend on GraphQLClient/TokenStorageService)
        ChangeNotifierProvider<RestaurantService>(
          create: (context) => RestaurantService(
            context.read<GraphQLClient>(),
            context.read<ApiService>(),
          ),
        ),
        ChangeNotifierProvider<UserService>(
          create: (context) => UserService(
            context.read<GraphQLClient>(),
            context.read<AuthService>(),
            context.read<ApiService>(),
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
            context.read<ApiService>(),
          ),
        ),
        ChangeNotifierProvider<ProductionService>(
          create: (context) => ProductionService(context.read<ApiService>()),
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
          create: (context) => StatisticsService(context.read<ApiService>()),
        ),
        ChangeNotifierProvider<PaymentService>(
          create: (context) => PaymentService(context.read<GraphQLClient>()),
        ),
        ChangeNotifierProvider<HomeService>(
          create: (context) => HomeService(context.read<ApiService>()),
        ),
        ChangeNotifierProvider<LanguageProvider>(
          create: (_) => LanguageProvider(),
        ),
      ],
      // Since loading is handled in main(), we use MaterialApp.router directly.
      child: Consumer<LanguageProvider>(
        builder: (context, languageProvider, child) {
          return MaterialApp.router(
            title: 'Catering App',
            scrollBehavior: const AppScrollBehavior(),
            theme: AppTheme.lightTheme,
            routerConfig: _appRouter.router,
            locale: languageProvider.currentLocale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [Locale('en'), Locale('pl')],
          );
        },
      ),
    );
  }
}
