import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/features/user/services/user_service.dart';
import 'package:catering_flutter/core/widgets/searchable_list_screen.dart';

class RestaurantDriversScreen extends StatefulWidget {
  final String restaurantIri;

  const RestaurantDriversScreen({super.key, required this.restaurantIri});

  @override
  State<RestaurantDriversScreen> createState() => _RestaurantDriversScreenState();
}

class _RestaurantDriversScreenState extends State<RestaurantDriversScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadDrivers();
    });
  }

  Future<void> _loadDrivers() async {
    await context.read<UserService>().fetchDriversByRestaurant(
      widget.restaurantIri,
    );
    if (!mounted) return;
    final service = context.read<UserService>();
    if (service.hasError) {
      UIErrorHandler.showSnackBar(
        context,
        service.errorMessage!,
        isError: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserService>(
      builder: (context, userService, child) {
        return SearchableListScreen<RestaurantUserNode>(
          title: 'Manage Drivers',
          items: userService.restaurantDrivers,
          isLoading: userService.isLoading,
          searchHint: 'Search drivers by email...',
          filter: (driver, query) => driver.email.toLowerCase().contains(query),
          onRefresh: _loadDrivers,
          itemBuilder: (context, driver) {
            return Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.primaryContainer,
                  child: Icon(
                    Icons.person,
                    size: 32,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
                title: Text(
                  driver.email,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Container(
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue),
                  ),
                  child: const Text(
                    'DRIVER',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                ),
                trailing: const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 32,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
