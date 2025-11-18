import 'package:catering_flutter/core/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/features/owner/services/restaurant_service.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart'; // Import CustomScaffold

class RestaurantsScreen extends StatefulWidget {
  const RestaurantsScreen({super.key});

  @override
  State<RestaurantsScreen> createState() => _RestaurantsScreenState();
}

class _RestaurantsScreenState extends State<RestaurantsScreen> {
  String? _selectedCategory;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RestaurantService>().fetchAllRestaurants();
    });
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
                .expand((restaurant) => restaurant.categories)
                .map((category) => category.name)
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
                    } else if (restaurantService.hasError) {
                      return Center(
                        child: Text(restaurantService.errorMessage!),
                      );
                    } else if (restaurantService.restaurants.isEmpty) {
                      return const Center(child: Text("No restaurants found."));
                    } else {
                      final filteredRestaurants = _selectedCategory == null
                          ? restaurantService.restaurants
                          : restaurantService.restaurants.where((r) {
                              return r.categories.any(
                                (c) => c.name == _selectedCategory,
                              );
                            }).toList();

                      return ListView.builder(
                        itemCount: filteredRestaurants.length,
                        itemBuilder: (context, index) {
                          final restaurant = filteredRestaurants[index];

                          return ListTile(
                            title: Text(
                              restaurant.name,
                            ),
                            onTap: () {
                              context.push(
                                AppRoutes.restaurantMealPlans.replaceAll(
                                  ':restaurantId',
                                  restaurant.id.toString(),
                                ),
                                extra: restaurant,
                              );
                            },
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
