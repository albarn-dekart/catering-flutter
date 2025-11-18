import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/app_routes.dart';
import 'package:catering_flutter/features/owner/services/restaurant_service.dart';
import 'package:catering_flutter/features/authentication/services/user_service.dart';
import 'package:catering_flutter/features/authentication/models/user.dart';
import 'package:catering_flutter/features/owner/models/restaurant_model.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart'; // Import CustomScaffold

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RestaurantService>().fetchAllRestaurants();
      context.read<UserService>().fetchAllUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: CustomScaffold(
        title: 'Admin Dashboard',
        bottom: const TabBar(
          tabs: [
            Tab(text: 'Manage Restaurants'),
            Tab(text: 'Manage Users'),
          ],
        ),
        child: TabBarView(
          children: [
            _buildManageRestaurantsTab(context),
            _buildManageUsersTab(context),
          ],
        ),
      ),
    );
  }

  Widget _buildManageRestaurantsTab(BuildContext context) {
    return Consumer<RestaurantService>(
      builder: (context, restaurantService, child) {
        if (restaurantService.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (restaurantService.hasError) {
          return Center(child: Text(restaurantService.errorMessage!));
        } else {
          final restaurants = restaurantService.restaurants;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    context.push(AppRoutes.createRestaurant);
                  },
                  child: const Text('Create New Restaurant'),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: restaurants.length,
                  itemBuilder: (context, index) {
                    final restaurant = restaurants[index];
                    return Card(
                      margin: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(restaurant.name),
                        subtitle: Text('ID: ${restaurant.id}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                context.push(
                                  AppRoutes.editRestaurant.replaceAll(
                                    ':restaurantId',
                                    restaurant.id.toString(),
                                  ),
                                  extra: restaurant,
                                );
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                _confirmDeleteRestaurant(context, restaurant);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }

  void _confirmDeleteRestaurant(BuildContext context, Restaurant restaurant) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: Text('Are you sure you want to delete ${restaurant.name}?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () async {
                final restaurantService = context.read<RestaurantService>();
                await restaurantService.deleteRestaurant(restaurant.id);
                if (!context.mounted) return;
                if (restaurantService.hasError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Failed to delete restaurant: ${restaurantService.errorMessage}',
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Restaurant deleted successfully.'),
                    ),
                  );
                  restaurantService.fetchAllRestaurants(); // Refresh the list
                }
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildManageUsersTab(BuildContext context) {
    return Consumer<UserService>(
      builder: (context, userService, child) {
        if (userService.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (userService.hasError) {
          return Center(child: Text(userService.errorMessage!));
        } else if (userService.users.isEmpty) {
          return const Center(child: Text('No users found.'));
        } else {
          return ListView.builder(
            itemCount: userService.users.length,
            itemBuilder: (context, index) {
              final user = userService.users[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(user.email),
                  subtitle: Text('Roles: ${user.roles.join(', ')}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.person_add_alt_1),
                        onPressed: () {
                          _showEditRolesDialog(context, user);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          _confirmDeleteUser(context, user);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }

  void _showEditRolesDialog(BuildContext context, User user) {
    final List<String> availableRoles = [
      'ROLE_CUSTOMER',
      'ROLE_ADMIN',
      'ROLE_DRIVER',
      'ROLE_RESTAURANT',
    ];
    List<String> selectedRoles = List.from(user.roles);

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Edit Roles for ${user.email}'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: availableRoles.map((role) {
                  return CheckboxListTile(
                    title: Text(role),
                    value: selectedRoles.contains(role),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          selectedRoles.add(role);
                        } else {
                          selectedRoles.remove(role);
                        }
                      });
                    },
                  );
                }).toList(),
              );
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () async {
                final userService = context.read<UserService>();
                await userService.updateUserRoles(user.id, selectedRoles);
                if (!context.mounted) return;
                if (userService.hasError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Failed to update roles: ${userService.errorMessage}',
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('User roles updated successfully.'),
                    ),
                  );
                  userService.fetchAllUsers(); // Refresh the list
                }
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _confirmDeleteUser(BuildContext context, User user) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: Text('Are you sure you want to delete ${user.email}?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () async {
                final userService = context.read<UserService>();
                await userService.deleteUser(user.id);
                if (!context.mounted) return;
                if (userService.hasError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Failed to delete user: ${userService.errorMessage}',
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('User deleted successfully.')),
                  );
                  userService.fetchAllUsers(); // Refresh the list
                }
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
