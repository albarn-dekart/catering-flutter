import 'package:catering_flutter/core/app_routes.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/core/widgets/custom_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/features/restaurant/services/restaurant_service.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/widgets/responsive_grid.dart';

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
      await context.read<RestaurantService>().fetchAllRestaurants();
      if (!mounted) return;
      final service = context.read<RestaurantService>();
      if (service.hasError) {
        UIErrorHandler.showSnackBar(
          context,
          service.errorMessage!,
          isError: true,
        );
      }
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
    return CustomScaffold(
      title: 'Restaurants',
      child: Consumer<RestaurantService>(
        builder: (context, restaurantService, child) {
          List<String> uniqueCategories = [];
          if (restaurantService.restaurants.isNotEmpty) {
            uniqueCategories = restaurantService.restaurants
                .expand(
                  (restaurant) =>
                      restaurant.restaurantCategories?.edges?.map(
                        (e) => e?.node?.name,
                      ) ??
                      [],
                )
                .whereType<String>()
                .toSet()
                .toList();
          }
          return Column(
            children: [
              _buildCategoryFilters(uniqueCategories),
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (restaurantService.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (restaurantService.restaurants.isEmpty) {
                      return const Center(child: Text("No restaurants found."));
                    } else {
                      final filteredRestaurants = _selectedCategory == null
                          ? restaurantService.restaurants
                          : restaurantService.restaurants.where((r) {
                              return r.restaurantCategories?.edges?.any(
                                    (e) => e?.node?.name == _selectedCategory,
                                  ) ??
                                  false;
                            }).toList();

                      return ResponsiveGridBuilder(
                        controller: _scrollController,
                        itemCount:
                            filteredRestaurants.length +
                            (restaurantService.isFetchingMore ? 1 : 0),
                        childAspectRatio: 0.7,
                        itemBuilder: (context, index) {
                          if (index >= filteredRestaurants.length) {
                            return const Center(
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }
                          final restaurant = filteredRestaurants[index];
                          final categories =
                              restaurant.restaurantCategories?.edges
                                  ?.map((e) => e?.node)
                                  .where((n) => n != null)
                                  .toList() ??
                              [];

                          return Card(
                            elevation: 2,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: InkWell(
                              onTap: () {
                                context.push(
                                  Uri(
                                    path: AppRoutes.mealPlansByRestaurant,
                                    queryParameters: {
                                      'restaurantId': IriHelper.getId(
                                        restaurant.id,
                                      ),
                                    },
                                  ).toString(),
                                  extra: restaurant,
                                );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Restaurant Image
                                  SizedBox(
                                    height: 180,
                                    width: double.infinity,
                                    child:
                                        restaurant.imageUrl != null &&
                                            restaurant.imageUrl!.isNotEmpty
                                        ? CustomCachedImage(
                                            imageUrl: restaurant.imageUrl,
                                            fit: BoxFit.cover,
                                          )
                                        : Container(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .surfaceContainerHighest,
                                            child: Center(
                                              child: Icon(
                                                Icons.restaurant,
                                                size: 48,
                                                color: Theme.of(
                                                  context,
                                                ).colorScheme.onSurfaceVariant,
                                              ),
                                            ),
                                          ),
                                  ),
                                  // Content
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                restaurant.name,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall
                                                    ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size: 16,
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.primary,
                                            ),
                                          ],
                                        ),
                                        if (categories.isNotEmpty) ...[
                                          const SizedBox(height: 8),
                                          Wrap(
                                            spacing: 8,
                                            runSpacing: 4,
                                            children: categories.map((c) {
                                              return Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 4,
                                                    ),
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondaryContainer,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Text(
                                                  c!.name,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelMedium
                                                      ?.copyWith(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onSecondaryContainer,
                                                      ),
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ],
                                        if (restaurant.description != null &&
                                            restaurant
                                                .description!
                                                .isNotEmpty) ...[
                                          const SizedBox(height: 12),
                                          Text(
                                            restaurant.description!,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSurfaceVariant,
                                                ),
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCategoryFilters(List<String> categories) {
    if (categories.isEmpty) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: 8.0,
        children: [
          ChoiceChip(
            label: const Text('All'),
            selected: _selectedCategory == null,
            onSelected: (selected) {
              setState(() {
                _selectedCategory = null;
              });
            },
          ),
          ...categories.map((categoryName) {
            return ChoiceChip(
              label: Text(categoryName),
              selected: _selectedCategory == categoryName,
              onSelected: (selected) {
                setState(() {
                  _selectedCategory = selected ? categoryName : null;
                });
              },
            );
          }),
        ],
      ),
    );
  }
}
