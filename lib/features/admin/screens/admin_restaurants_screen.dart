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
import 'package:catering_flutter/core/widgets/card_action_buttons.dart';

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
    final confirmed = await DeleteConfirmationDialog.show(
      context: context,
      title: AppLocalizations.of(context)!.deleteRestaurant,
      message: AppLocalizations.of(
        context,
      )!.deleteRestaurantConfirmation(restaurant.name),
    );

    if (confirmed && context.mounted) {
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
    return Consumer<RestaurantService>(
      builder: (context, restaurantService, child) {
        return SearchableListScreen<Restaurant>(
          title: AppLocalizations.of(context)!.manageRestaurants,
          items: restaurantService.restaurants,
          isLoading: restaurantService.isLoading,
          isLoadingMore: restaurantService.isFetchingMore,
          totalItems: restaurantService.totalItems,
          hasError: restaurantService.hasError,
          errorMessage: restaurantService.errorMessage,
          onRetry: () => restaurantService.fetchAllRestaurants(),
          searchHint: AppLocalizations.of(context)!.searchRestaurants,
          useGrid: true,
          onSearch: (query) {
            restaurantService.fetchAllRestaurants(searchQuery: query);
          },
          onCreate: () => context.push(AppRoutes.adminRestaurantCreate),
          onLoadMore: () async {
            if (!restaurantService.isFetchingMore &&
                restaurantService.hasNextPage) {
              await restaurantService.loadMoreRestaurants();
            }
          },
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
              actions: CardActionButtons(
                onEdit: () {
                  context.push(
                    Uri(
                      path: AppRoutes.restaurantForm,
                      queryParameters: {'id': IriHelper.getId(restaurant.id)},
                    ).toString(),
                  );
                },
                onDelete: () => _deleteRestaurant(context, restaurant),
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
