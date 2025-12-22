import 'package:catering_flutter/core/app_router.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/features/restaurant/services/restaurant_service.dart';
import 'package:catering_flutter/core/widgets/searchable_list_screen.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:catering_flutter/core/widgets/restaurant_card.dart';

class RestaurantsScreen extends StatefulWidget {
  const RestaurantsScreen({super.key});

  @override
  State<RestaurantsScreen> createState() => _RestaurantsScreenState();
}

class _RestaurantsScreenState extends State<RestaurantsScreen> {
  String? _selectedCategory;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<RestaurantService>().fetchCategories();
      if (!mounted) return;
      await context.read<RestaurantService>().fetchAllRestaurants();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      final service = context.read<RestaurantService>();
      if (!service.isLoading &&
          !service.isFetchingMore &&
          service.hasNextPage) {
        service.loadMoreRestaurants();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantService>(
      builder: (context, restaurantService, child) {
        final categories = restaurantService.categories
            .map((c) => c.name)
            .toList();

        return SearchableListScreen(
          title: AppLocalizations.of(context)!.restaurants,
          items: restaurantService.restaurants,
          isLoading: restaurantService.isLoading,
          isLoadingMore: restaurantService.isFetchingMore,
          searchHint: AppLocalizations.of(context)!.searchRestaurants,
          onRefresh: () async {
            await restaurantService.fetchAllRestaurants();
          },
          hasError: restaurantService.hasError,
          errorMessage: restaurantService.errorMessage,
          onRetry: () => restaurantService.fetchAllRestaurants(),
          onLoadMore: () async {
            if (!restaurantService.isFetchingMore &&
                restaurantService.hasNextPage) {
              await restaurantService.loadMoreRestaurants();
            }
          },
          onSearch: (query) {
            restaurantService.fetchAllRestaurants(
              searchQuery: query,
              category: _selectedCategory,
            );
          },
          useGrid: true,
          preferredItemHeight: 300,
          customFilters: FilterChipsBar<String>(
            values: categories,
            selectedValue: _selectedCategory,
            allLabel: AppLocalizations.of(context)!.all,
            labelBuilder: (c) => c,
            onSelected: (category) {
              setState(() {
                _selectedCategory = category;
              });
              restaurantService.fetchAllRestaurants(
                searchQuery: restaurantService.currentSearchQuery,
                category: category,
              );
            },
          ),
          itemBuilder: (context, restaurant) {
            final categories =
                restaurant.restaurantCategories?.edges
                    ?.map((e) => e?.node)
                    .where((n) => n != null)
                    .toList() ??
                [];

            return RestaurantCard(
              id: restaurant.id,
              name: restaurant.name,
              description: restaurant.description,
              imageUrl: restaurant.imageUrl,
              categories: categories.map((c) => c!.name).toList(),
              onTap: () {
                context.push(
                  Uri(
                    path: AppRoutes.mealPlansByRestaurant,
                    queryParameters: {
                      'restaurantId': IriHelper.getId(restaurant.id),
                    },
                  ).toString(),
                  extra: restaurant,
                );
              },
            );
          },
        );
      },
    );
  }
}
