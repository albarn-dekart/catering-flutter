import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'package:catering_flutter/features/driver/services/delivery_service.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart'; // Import CustomScaffold

class DriverDashboardScreen extends StatefulWidget {
  const DriverDashboardScreen({super.key});

  @override
  State<DriverDashboardScreen> createState() => _DriverDashboardScreenState();
}

class _DriverDashboardScreenState extends State<DriverDashboardScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DeliveryService>().fetchDriverDeliveries();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Driver Dashboard',
      child: Consumer<DeliveryService>(
        builder: (context, deliveryService, child) {
          if (deliveryService.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (deliveryService.hasError) {
            return Center(child: Text(deliveryService.errorMessage!));
          } else if (deliveryService.deliveries.isEmpty) {
            return const Center(child: Text('No deliveries assigned.'));
          } else {
            return ListView.builder(
              itemCount: deliveryService.deliveries.length,
              itemBuilder: (context, index) {
                final delivery = deliveryService.deliveries[index];
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
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed:
                                  delivery.status == 'Pending' &&
                                      !deliveryService.isLoading
                                  ? () async {
                                      await deliveryService
                                          .updateDeliveryStatus(
                                            delivery.id,
                                            'Picked_up',
                                          );
                                    }
                                  : null,
                              child:
                                  deliveryService.isLoading &&
                                      delivery.status == 'Pending'
                                  ? const CircularProgressIndicator()
                                  : const Text('Pick Up'),
                            ),
                            ElevatedButton(
                              onPressed:
                                  delivery.status == 'Picked_up' &&
                                      !deliveryService.isLoading
                                  ? () async {
                                      await deliveryService
                                          .updateDeliveryStatus(
                                            delivery.id,
                                            'Delivered',
                                          );
                                    }
                                  : null,
                              child:
                                  deliveryService.isLoading &&
                                      delivery.status == 'Picked_up'
                                  ? const CircularProgressIndicator()
                                  : const Text('Deliver'),
                            ),
                          ],
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
