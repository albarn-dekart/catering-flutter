import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:catering_flutter/core/config.dart';
import 'package:catering_flutter/features/customer/services/cart_service.dart';
import 'package:catering_flutter/features/customer/services/order_service.dart';
import 'package:catering_flutter/features/customer/services/payment_service.dart';
import 'package:catering_flutter/features/customer/models/order_item_model.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart'; // Import CustomScaffold

class ConfirmDeliveryScreen extends StatefulWidget {
  const ConfirmDeliveryScreen({super.key});

  @override
  State<ConfirmDeliveryScreen> createState() => _ConfirmDeliveryScreenState();
}

class _ConfirmDeliveryScreenState extends State<ConfirmDeliveryScreen> {
  // Calculate the initial start and end dates
  final DateTime _initialStartDate = DateTime.now().add(
    const Duration(days: 1),
  );
  final DateTime _initialEndDate = DateTime.now().add(const Duration(days: 7));

  // Initialize with the calculated dates in initState
  DateTime? _startDate;
  DateTime? _endDate;

  // Initialize with all days of the week active
  final Set<String> _selectedDeliveryDays = {
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  };

  @override
  void initState() {
    super.initState();
    // Set initial dates
    _startDate = _initialStartDate;
    _endDate = _initialEndDate;
    // Update the cart service with the initial delivery days and date range
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateCartDeliveryDetails();
    });
  }

  void _updateCartDeliveryDetails() {
    final cartService = context.read<CartService>();
    if (_startDate == null ||
        _endDate == null ||
        _selectedDeliveryDays.isEmpty) {
      cartService.updateDeliveryDetails([], []);
      return;
    }

    final List<DateTime> actualDeliveryDates = [];
    DateTime currentDate = _startDate!;
    while (currentDate.isBefore(_endDate!.add(const Duration(days: 1)))) {
      final String dayOfWeek = DateFormat(
        'EEE',
      ).format(currentDate); // e.g., Mon, Tue
      if (_selectedDeliveryDays.contains(dayOfWeek)) {
        actualDeliveryDates.add(currentDate);
      }
      currentDate = currentDate.add(const Duration(days: 1));
    }
    cartService.updateDeliveryDetails(
      actualDeliveryDates,
      _selectedDeliveryDays.toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Delivery Details',
      child: Consumer3<CartService, OrderService, PaymentService>(
        builder: (context, cartService, orderService, paymentService, child) {
          if (orderService.isOrderCreated) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              paymentService.createCheckoutSession(
                orderId: orderService.createdOrder!.id,
              );
              orderService.clearOrderCreatedStatus();
            });
          } else if (orderService.hasError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(orderService.errorMessage!)),
              );
              orderService.clearOrderCreatedStatus();
            });
          } else if (paymentService.checkoutSessionCreated) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              paymentService.redirectToStripeCheckout(
                apiKey: AppConfig.stripePublishableKey,
                sessionId: paymentService.checkoutSessionId!,
              );
              paymentService.clearCheckoutSessionStatus();
            });
          } else if (paymentService.hasError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(paymentService.errorMessage!)),
              );
              paymentService.clearCheckoutSessionStatus();
            });
          }

          if (cartService.cartItems.isEmpty) {
            return const Center(child: Text('Your cart is empty.'));
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Date Range Picker
                Text(
                  'Order Duration:',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: _pickDateRange,
                  child: Text(
                    _startDate == null || _endDate == null
                        ? 'Select Date Range'
                        : '${DateFormat('dd/MM/yyyy').format(_startDate!)} - ${DateFormat('dd/MM/yyyy').format(_endDate!)}',
                  ),
                ),
                const SizedBox(height: 16),
                // Delivery Days Selector
                Text(
                  'Select Delivery Days:',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8.0,
                  children:
                      <String>[
                        'Mon',
                        'Tue',
                        'Wed',
                        'Thu',
                        'Fri',
                        'Sat',
                        'Sun',
                      ].map((String day) {
                        return ChoiceChip(
                          label: Text(day),
                          selected: _selectedDeliveryDays.contains(day),
                          onSelected: (bool selected) {
                            setState(() {
                              if (selected) {
                                _selectedDeliveryDays.add(day);
                              } else {
                                _selectedDeliveryDays.remove(day);
                              }
                              _updateCartDeliveryDetails(); // Call after updating selected days
                            });
                          },
                        );
                      }).toList(),
                ),
                const SizedBox(height: 16),
                // Total from Cart (for display purposes, actual calculation will be backend-driven)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Estimated Total:', // Changed to estimated
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${cartService.totalPrice.toStringAsFixed(2)} PLN',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed:
                        (orderService.isLoading ||
                            _startDate == null ||
                            _endDate == null ||
                            _selectedDeliveryDays.isEmpty)
                        ? null
                        : () {
                            final orderItems = cartService.cartItems
                                .map(
                                  (item) => OrderItem(
                                    id: 0,
                                    mealPlan: item.mealPlan,
                                    quantity: item.quantity,
                                  ),
                                )
                                .toList();

                            // Assuming all cart items belong to the same restaurant
                            final restaurantId = cartService
                                .cartItems
                                .first
                                .mealPlan
                                .restaurant!
                                .id;

                            orderService.createOrder(
                              orderItems: orderItems.cast<OrderItem>(),
                              restaurantId: restaurantId,
                              deliveryStartDate: _startDate!,
                              deliveryEndDate: _endDate!,
                              deliveryDays: _selectedDeliveryDays.toList(),
                            );
                          },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: (orderService.isLoading)
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            'Confirm Order', // Changed button text
                            style: TextStyle(fontSize: 18),
                          ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _pickDateRange() async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now().add(const Duration(days: 1)),
      lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
      initialDateRange: _startDate != null && _endDate != null
          ? DateTimeRange(start: _startDate!, end: _endDate!)
          : null,
    );
    if (picked != null &&
        picked !=
            DateTimeRange(
              start: _startDate ?? DateTime.now(),
              end: _endDate ?? DateTime.now(),
            )) {
      setState(() {
        _startDate = picked.start;
        _endDate = picked.end;
        _updateCartDeliveryDetails(); // Call after updating date range
      });
    }
  }
}
