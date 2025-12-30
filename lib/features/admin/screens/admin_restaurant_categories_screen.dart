import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/features/restaurant/services/restaurant_category_service.dart';
import 'package:catering_flutter/features/restaurant/widgets/category_management_tab.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';

class AdminRestaurantCategoriesScreen extends StatelessWidget {
  const AdminRestaurantCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: AppLocalizations.of(context)!.restaurantCategories,
      child: Consumer<RestaurantCategoryService>(
        builder: (context, service, _) {
          return CategoryManagementTab(
            title: AppLocalizations.of(context)!.restaurantCategories,
            categoryType: AppLocalizations.of(context)!.roleRestaurant,
            fetchCategories: () async {
              await service.getRestaurantCategories();
              return service.restaurantCategories
                  .map((c) => CategoryItem(id: c.id, name: c.name))
                  .toList();
            },
            createCategory: (name) => service.createRestaurantCategory(name),
            updateCategory: (id, name) =>
                service.updateRestaurantCategory(id, name),
            deleteCategory: (id) => service.deleteRestaurantCategory(id),
            hasError: service.hasError,
            errorMessage: service.errorMessage,
            onRetry: () => service.getRestaurantCategories(),
            onCancel: () => service.clearError(),
          );
        },
      ),
    );
  }
}
