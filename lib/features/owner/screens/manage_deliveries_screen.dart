import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/features/driver/services/delivery_service.dart';
import 'package:catering_flutter/features/owner/services/restaurant_service.dart';
import 'package:catering_flutter/features/authentication/services/user_service.dart';
import 'package:catering_flutter/features/authentication/models/user.dart';

class ManageDeliveriesScreen extends StatefulWidget {
  const ManageDeliveriesScreen({super.key});

  @override
  State<ManageDeliveriesScreen> createState() => _ManageDeliveriesScreenState();
}

class _ManageDeliveriesScreenState extends State<ManageDeliveriesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final restaurantService = context.read<RestaurantService>();
      if (restaurantService.currentRestaurant != null) {
        context.read<DeliveryService>().fetchRestaurantDeliveries(
          restaurantService.currentRestaurant!.id,
        );
        context
            .read<UserService>()
            .fetchAllUsers(); // Fetch all users to select drivers
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Manage Deliveries',
      child: Consumer2<DeliveryService, UserService>(
        builder: (context, deliveryService, userService, child) {
          if (deliveryService.isLoading || userService.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (deliveryService.hasError) {
            return Center(child: Text(deliveryService.errorMessage!));
          } else if (deliveryService.deliveries.isEmpty) {
            return const Center(
              child: Text('No deliveries found for your restaurant.'),
            );
          } else {
            final deliveries = deliveryService.deliveries;
            final drivers = userService.users
                .where((user) => user.roles.contains('ROLE_DRIVER'))
                .toList();

            return ListView.builder(
              itemCount: deliveries.length,
              itemBuilder: (context, index) {
                final delivery = deliveries[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order ID: ${delivery.order?.id ?? ''}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Delivery Date: ${DateFormat('yyyy-MM-dd').format(delivery.deliveryDate)}',
                        ),
                        Text('Status: ${delivery.status}'),
                        Text('Driver: ${delivery.driver?.email ?? 'Unassigned'}'),
                        const SizedBox(height: 10),
                        if (drivers.isNotEmpty)
                          DropdownButtonFormField<User>(
                            decoration: const InputDecoration(
                              labelText: 'Assign Driver',
                              border: OutlineInputBorder(),
                            ),
                            initialValue: delivery.driver,
                            onChanged: (User? newDriver) async {
                              if (newDriver != null) {
                                await deliveryService.updateDeliveryStatus(
                                  delivery.id,
                                  delivery.status, // Keep current status
                                  driverId: newDriver.id,
                                );
                                if (!context.mounted) return;
                                if (deliveryService.hasError) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Failed to assign driver: ${deliveryService.errorMessage}',
                                      ),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Driver assigned successfully.',
                                      ),
                                    ),
                                  );
                                  // Refresh deliveries
                                  final restaurantService = context
                                      .read<RestaurantService>();
                                  deliveryService.fetchRestaurantDeliveries(
                                    restaurantService.currentRestaurant!.id,
                                  );
                                }
                              }
                            },
                            items: drivers.map((User driver) {
                              return DropdownMenuItem<User>(
                                value: driver,
                                child: Text(driver.email),
                              );
                            }).toList(),
                          ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed:
                              delivery.status == 'Pending' &&
                                  !deliveryService.isLoading
                              ? () async {
                                  await deliveryService.updateDeliveryStatus(
                                    delivery.id,
                                    'Cancelled',
                                  );
                                  if (!context.mounted) return;
                                  if (deliveryService.hasError) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Failed to cancel delivery: ${deliveryService.errorMessage}',
                                        ),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Delivery cancelled successfully.',
                                        ),
                                      ),
                                    );
                                    // Refresh deliveries
                                    final restaurantService = context
                                        .read<RestaurantService>();
                                    deliveryService.fetchRestaurantDeliveries(
                                      restaurantService.currentRestaurant!.id,
                                    );
                                  }
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: const Text('Cancel Delivery'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
