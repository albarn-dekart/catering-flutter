import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:catering_flutter/core/app_router.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';

import 'package:catering_flutter/features/restaurant/services/restaurant_service.dart';
import 'package:catering_flutter/core/widgets/searchable_list_screen.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:catering_flutter/core/widgets/restaurant_card.dart';

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
        title: Text(AppLocalizations.of(context)!.deleteRestaurant),
        content: Text(
          AppLocalizations.of(
            context,
          )!.deleteRestaurantConfirmation(restaurant.name),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text(AppLocalizations.of(context)!.delete),
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
            AppLocalizations.of(context)!.restaurantDeleted,
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
    final isNarrow = MediaQuery.of(context).size.width < 700;
    return Consumer<RestaurantService>(
      builder: (context, restaurantService, child) {
        return SearchableListScreen<Restaurant>(
          title: AppLocalizations.of(context)!.manageRestaurants,
          items: restaurantService.restaurants,
          isLoading: restaurantService.isLoading,
          searchHint: AppLocalizations.of(context)!.searchRestaurants,
          useGrid: true,
          preferredItemHeight: 350,
          onSearch: (query) {
            restaurantService.fetchAllRestaurants(searchQuery: query);
          },
          onLoadMore: () async {
            if (!restaurantService.isFetchingMore &&
                restaurantService.hasNextPage) {
              await restaurantService.loadMoreRestaurants();
            }
          },
          floatingActionButton: isNarrow
              ? FloatingActionButton(
                  onPressed: () =>
                      context.push(AppRoutes.adminRestaurantCreate),
                  tooltip: AppLocalizations.of(context)!.addRestaurant,
                  child: const Icon(Icons.add_business),
                )
              : FloatingActionButton.extended(
                  onPressed: () =>
                      context.push(AppRoutes.adminRestaurantCreate),
                  icon: const Icon(Icons.add_business),
                  label: Text(AppLocalizations.of(context)!.addRestaurant),
                ),
          onRefresh: () async {
            await restaurantService.fetchAllRestaurants();
          },
          itemBuilder: (context, restaurant) {
            return RestaurantCard(
              id: restaurant.id,
              name: restaurant.name,
              description: restaurant.description,
              imageUrl: restaurant.imageUrl,
              categories: restaurant.restaurantCategories?.edges
                  ?.map((e) => e?.node?.name)
                  .whereType<String>()
                  .toList(),

              actions: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton.filledTonal(
                    icon: const Icon(Icons.delete_outline),
                    tooltip: AppLocalizations.of(context)!.delete,
                    style: IconButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.error,
                      backgroundColor: Theme.of(
                        context,
                      ).colorScheme.errorContainer,
                    ),
                    onPressed: () => _deleteRestaurant(context, restaurant),
                  ),
                ],
              ),
              onTap: () {
                context.push(
                  Uri(
                    path: AppRoutes.restaurantDashboard,
                    queryParameters: {'id': IriHelper.getId(restaurant.id)},
                  ).toString(),
                );
              },
            );
          },
        );
      },
    );
  }
}
