import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/app_routes.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/core/widgets/responsive_grid_inline.dart';

import 'package:catering_flutter/core/utils/image_helper.dart';
import 'package:catering_flutter/features/restaurant/services/restaurant_service.dart';

import 'package:catering_flutter/features/order/services/order_service.dart';
import 'package:catering_flutter/features/user/services/user_service.dart';
import 'package:catering_flutter/graphql/schema.graphql.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  final TextEditingController _restaurantSearchController =
      TextEditingController();
  final TextEditingController _userSearchController = TextEditingController();
  String _selectedOrderStatus = 'All';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RestaurantService>().fetchAllRestaurants();
      context.read<UserService>().fetchAllUsers();
      context.read<OrderService>().fetchAllOrders();
    });
  }

  @override
  void dispose() {
    _restaurantSearchController.dispose();
    _userSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: CustomScaffold(
        title: 'Admin Dashboard',
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            child: TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              labelPadding: const EdgeInsets.symmetric(horizontal: 24),
              tabs: const [
                Tab(
                  child: Row(
                    children: [
                      Icon(Icons.dashboard),
                      SizedBox(width: 8),
                      Text('Overview'),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      Icon(Icons.store),
                      SizedBox(width: 8),
                      Text('Restaurants'),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      Icon(Icons.people),
                      SizedBox(width: 8),
                      Text('Users'),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      Icon(Icons.receipt_long),
                      SizedBox(width: 8),
                      Text('Orders'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        child: TabBarView(
          children: [
            _buildOverviewTab(),
            _buildRestaurantsTab(),
            _buildUsersTab(),
            _buildOrdersTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewTab() {
    return Consumer3<RestaurantService, UserService, OrderService>(
      builder: (context, restaurantService, userService, orderService, child) {
        if (restaurantService.isLoading ||
            userService.isLoading ||
            orderService.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Platform Overview',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ResponsiveGridInline(
                padding: EdgeInsets.zero,
                children: [
                  _buildSummaryCard(
                    context,
                    title: 'Restaurants',
                    count: restaurantService.restaurants.length.toString(),
                    icon: Icons.store,
                    color: Colors.orange,
                  ),
                  _buildSummaryCard(
                    context,
                    title: 'Users',
                    count: userService.users.length.toString(),
                    icon: Icons.people,
                    color: Colors.blue,
                  ),
                  _buildSummaryCard(
                    context,
                    title: 'Total Orders',
                    count: orderService.orders.length.toString(),
                    icon: Icons.receipt_long,
                    color: Colors.green,
                  ),
                  _buildSummaryCard(
                    context,
                    title: 'Pending Orders',
                    count: orderService.orders
                        .where((o) => o.status == Enum$OrderStatus.Unpaid)
                        .length
                        .toString(),
                    icon: Icons.pending_actions,
                    color: Colors.purple,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSummaryCard(
    BuildContext context, {
    required String title,
    required String count,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 150),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 32, color: color),
            ),
            const SizedBox(height: 12),
            Text(
              count,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRestaurantsTab() {
    return Consumer<RestaurantService>(
      builder: (context, restaurantService, child) {
        if (restaurantService.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final filteredRestaurants = restaurantService.restaurants.where((
          restaurant,
        ) {
          final name = restaurant.name;
          return name.toLowerCase().contains(
            _restaurantSearchController.text.toLowerCase(),
          );
        }).toList();

        return Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => context.push(AppRoutes.createRestaurant),
            icon: const Icon(Icons.add),
            label: const Text('Add Restaurant'),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _restaurantSearchController,
                  decoration: InputDecoration(
                    hintText: 'Search restaurants...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                  ),
                  onChanged: (_) => setState(() {}),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: filteredRestaurants.length,
                  itemBuilder: (context, index) {
                    final restaurant = filteredRestaurants[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
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
                            image: restaurant.imageUrl != null
                                ? DecorationImage(
                                    image: NetworkImage(
                                      ImageHelper.getFullImageUrl(
                                        restaurant.imageUrl!,
                                      )!,
                                    ),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                          child: restaurant.imageUrl == null
                              ? const Icon(Icons.store)
                              : null,
                        ),
                        title: Text(
                          restaurant.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('ID: ${IriHelper.getId(restaurant.id)}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () =>
                              _deleteRestaurant(context, restaurant),
                        ),
                        onTap: () {
                          context.push(
                            Uri(
                              path: AppRoutes.restaurantDashboard,
                              queryParameters: {
                                'id': IriHelper.getId(restaurant.id),
                              },
                            ).toString(),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
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

  Widget _buildUsersTab() {
    return Consumer<UserService>(
      builder: (context, userService, child) {
        if (userService.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final filteredUsers = userService.users.where((user) {
          return user.email.toLowerCase().contains(
            _userSearchController.text.toLowerCase(),
          );
        }).toList();

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _userSearchController,
                decoration: InputDecoration(
                  hintText: 'Search users by email...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                ),
                onChanged: (_) => setState(() {}),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: filteredUsers.length,
                itemBuilder: (context, index) {
                  final user = filteredUsers[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: ExpansionTile(
                      leading: CircleAvatar(
                        child: Text(
                          user.email.isNotEmpty
                              ? user.email[0].toUpperCase()
                              : '?',
                        ),
                      ),
                      title: Text(
                        user.email,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'ID: ${user.id} • Roles: ${user.roles.length}',
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              _buildRoleChip(
                                context,
                                userService,
                                user,
                                'ROLE_ADMIN',
                                'Admin',
                              ),
                              _buildRoleChip(
                                context,
                                userService,
                                user,
                                'ROLE_RESTAURANT',
                                'Restaurant',
                              ),
                              _buildRoleChip(
                                context,
                                userService,
                                user,
                                'ROLE_DRIVER',
                                'Driver',
                              ),
                              _buildRoleChip(
                                context,
                                userService,
                                user,
                                'ROLE_CUSTOMER',
                                'Customer',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildRoleChip(
    BuildContext context,
    UserService userService,
    UserNode user,
    String role,
    String label,
  ) {
    final rolesList = user.roles;
    final isSelected = rolesList.contains(role);
    return FilterChip(
      label: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      selectedColor: Theme.of(context).primaryColor,
      checkmarkColor: Colors.white,
      onSelected: (selected) async {
        final currentRoles = List<String>.from(rolesList);
        if (selected) {
          currentRoles.add(role);
        } else {
          currentRoles.remove(role);
        }

        try {
          await userService.updateUserRoles(user.id, currentRoles);
          if (context.mounted) {
            UIErrorHandler.showSnackBar(
              context,
              'Roles updated successfully',
              isError: false,
            );
          }
        } catch (e) {
          if (context.mounted) {
            UIErrorHandler.handleError(context, e);
          }
        }
      },
    );
  }

  Widget _buildOrdersTab() {
    return Consumer<OrderService>(
      builder: (context, orderService, child) {
        if (orderService.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final filteredOrders = _selectedOrderStatus == 'All'
            ? orderService.orders
            : orderService.orders
                  .where((o) => o.status.name == _selectedOrderStatus)
                  .toList();

        return Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(16),
              child: Row(
                children:
                    [
                      'All',
                      'Unpaid',
                      'Paid',
                      'Active',
                      'Completed',
                      'Cancelled',
                    ].map((status) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ChoiceChip(
                          label: Text(
                            status,
                            style: TextStyle(
                              color: _selectedOrderStatus == status
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: _selectedOrderStatus == status
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                          selected: _selectedOrderStatus == status,
                          selectedColor: Theme.of(context).primaryColor,
                          checkmarkColor: Colors.white,
                          onSelected: (selected) {
                            if (selected) {
                              setState(() => _selectedOrderStatus = status);
                            }
                          },
                        ),
                      );
                    }).toList(),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: filteredOrders.length,
                itemBuilder: (context, index) {
                  final order = filteredOrders[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      title: Text(
                        'Order #${IriHelper.getId(order.id)}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Status: ${order.status.name}'),
                          Text(
                            'Total: ${(order.total).toStringAsFixed(2)} PLN',
                          ),
                        ],
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        context.push(
                          Uri(
                            path: AppRoutes.orderDetail,
                            queryParameters: {'id': IriHelper.getId(order.id)},
                          ).toString(),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
