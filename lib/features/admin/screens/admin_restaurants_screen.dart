import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:catering_flutter/core/app_routes.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';

import 'package:catering_flutter/features/restaurant/services/restaurant_service.dart';
import 'package:catering_flutter/core/widgets/searchable_list_screen.dart';
import 'package:catering_flutter/core/widgets/custom_cached_image.dart';

class AdminRestaurantsScreen extends StatefulWidget {
  const AdminRestaurantsScreen({super.key});

  @override
  State<AdminRestaurantsScreen> createState() => _AdminRestaurantsScreenState();
}

class _AdminRestaurantsScreenState extends State<AdminRestaurantsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RestaurantService>().fetchAllRestaurants();
    });
  }

  Future<void> _deleteRestaurant(
    BuildContext context,
    Restaurant restaurant,
  ) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Restaurant'),
        content: Text('Are you sure you want to delete "${restaurant.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirm == true && context.mounted) {
      final service = context.read<RestaurantService>();
      try {
        await service.deleteRestaurant(restaurant.id);
        if (context.mounted) {
          UIErrorHandler.showSnackBar(
            context,
            'Restaurant deleted',
            isError: false,
          );
        }
      } catch (e) {
        if (context.mounted) {
          UIErrorHandler.handleError(context, e);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantService>(
      builder: (context, restaurantService, child) {
        return SearchableListScreen<Restaurant>(
          title: 'Manage Restaurants',
          items: restaurantService.restaurants,
          isLoading: restaurantService.isLoading,
          searchHint: 'Search restaurants...',
          filter: (restaurant, query) =>
              restaurant.name.toLowerCase().contains(query),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => context.push(AppRoutes.adminRestaurantCreate),
            icon: const Icon(Icons.add_business),
            label: const Text('Add Restaurant'),
          ),
          onRefresh: () async {
            await restaurantService.fetchAllRestaurants();
          },
          itemBuilder: (context, restaurant) {
            return Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: restaurant.imageUrl != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: CustomCachedImage(
                            imageUrl: restaurant.imageUrl,
                            fit: BoxFit.cover,
                            width: 60,
                            height: 60,
                          ),
                        )
                      : const Icon(Icons.store),
                ),
                title: Text(
                  restaurant.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('ID: ${IriHelper.getId(restaurant.id)}'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _deleteRestaurant(context, restaurant),
                ),
                onTap: () {
                  context.push(
                    Uri(
                      path: AppRoutes.restaurantDashboard,
                      queryParameters: {'id': IriHelper.getId(restaurant.id)},
                    ).toString(),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
