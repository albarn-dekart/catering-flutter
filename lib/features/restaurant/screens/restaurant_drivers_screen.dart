import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/features/user/services/user_service.dart';
import 'package:catering_flutter/core/widgets/searchable_list_screen.dart';

class RestaurantDriversScreen extends StatefulWidget {
  final String restaurantIri;

  const RestaurantDriversScreen({super.key, required this.restaurantIri});

  @override
  State<RestaurantDriversScreen> createState() =>
      _RestaurantDriversScreenState();
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
        return Scaffold(
          body: SearchableListScreen<RestaurantUserNode>(
            title: 'Manage Drivers',
            items: userService.restaurantDrivers,
            isLoading: userService.isLoading,
            searchHint: 'Search drivers by email...',
            filter: (driver, query) =>
                driver.email.toLowerCase().contains(query),
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
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: _showInviteDriverDialog,
            icon: const Icon(Icons.person_add),
            label: const Text('Invite Driver'),
          ),
        );
      },
    );
  }

  void _showInviteDriverDialog() {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Invite New Driver'),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Temporary Password',
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                try {
                  Navigator.pop(context); // Close dialog first
                  await context.read<UserService>().createDriver(
                    emailController.text,
                    passwordController.text,
                    restaurantIri: widget.restaurantIri,
                  );
                  if (!context.mounted) return;
                  UIErrorHandler.showSnackBar(
                    context,
                    'Driver invited successfully',
                  );
                  _loadDrivers(); // Refresh list
                } catch (e) {
                  if (!context.mounted) return;
                  UIErrorHandler.showSnackBar(
                    context,
                    'Failed to invite driver: $e',
                    isError: true,
                  );
                }
              }
            },
            child: const Text('Invite'),
          ),
        ],
      ),
    );
  }
}
