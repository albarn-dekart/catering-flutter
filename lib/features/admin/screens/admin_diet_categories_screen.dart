import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/features/restaurant/services/diet_category_service.dart';
import 'package:catering_flutter/features/restaurant/widgets/category_management_tab.dart';

class AdminDietCategoriesScreen extends StatelessWidget {
  const AdminDietCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Diet Categories',
      child: Consumer<DietCategoryService>(
        builder: (context, service, _) {
          return CategoryManagementTab(
            title: 'Diet Categories',
            categoryType: 'Diet',
            fetchCategories: () async {
              await service.getDietCategories();
              return service.dietCategories
                  .map((c) => CategoryItem(id: c.id, name: c.name))
                  .toList();
            },
            createCategory: (name) => service.createDietCategory(name),
            updateCategory: (id, name) => service.updateDietCategory(id, name),
            deleteCategory: (id) => service.deleteDietCategory(id),
          );
        },
      ),
    );
  }
}
