import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:catering_flutter/core/app_routes.dart';
import 'package:catering_flutter/core/auth_service.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/features/order/services/cart_service.dart';
import 'package:catering_flutter/features/order/services/order_service.dart';
import 'package:catering_flutter/features/user/services/address_service.dart';

class ConfirmOrderScreen extends StatefulWidget {
  const ConfirmOrderScreen({super.key});

  @override
  State<ConfirmOrderScreen> createState() => _ConfirmOrderScreenState();
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
  DateTime? _startDate;
  DateTime? _endDate;
  final DateTime _initialStartDate = DateTime.now().add(
    const Duration(days: 1),
  );
  final DateTime _initialEndDate = DateTime.now().add(const Duration(days: 7));
  final Set<String> _selectedDeliveryDays = {
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  };

  Address? _selectedAddress;

  @override
  void initState() {
    super.initState();
    // Set initial dates
    _startDate = _initialStartDate;
    _endDate = _initialEndDate;
    // Update the cart service with the initial delivery days and date range
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateCartDeliveryDetails();
      _loadDefaultAddress();
    });
  }

  Future<void> _loadDefaultAddress() async {
    final addressService = context.read<AddressService>();
    final userIri = context.read<AuthService>().userIri;
    if (userIri != null) {
      await addressService.fetchAddresses(userIri);
      if (mounted) {
        setState(() {
          _selectedAddress = addressService.defaultAddress;
        });
      }
    }
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
      child: Consumer2<CartService, OrderService>(
        builder: (context, cartService, orderService, child) {
          if (cartService.cartItems.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 64,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Your cart is empty',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            );
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Address Section
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.outlineVariant,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Delivery Address',
                                  style: Theme.of(context).textTheme.titleMedium
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () async {
                                final result = await context.push(
                                  Uri(
                                    path: AppRoutes.addressList,
                                    queryParameters: {'selection': 'true'},
                                  ).toString(),
                                );
                                if (result != null && result is Address) {
                                  setState(() {
                                    _selectedAddress = result;
                                  });
                                }
                              },
                              child: Text(
                                _selectedAddress == null ? 'Add' : 'Change',
                              ),
                            ),
                          ],
                        ),
                        if (_selectedAddress != null) ...[
                          const SizedBox(height: 8),
                          Text(
                            '${_selectedAddress!.firstName} ${_selectedAddress!.lastName}',
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(_selectedAddress!.street),
                          if (_selectedAddress!.apartment != null)
                            Text('Apt: ${_selectedAddress!.apartment}'),
                          Text(
                            '${_selectedAddress!.city}, ${_selectedAddress!.zipCode}',
                          ),
                          Text(_selectedAddress!.phoneNumber),
                        ] else
                          const Text('Please select a delivery address'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Duration Section
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.outlineVariant,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.date_range,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Order Duration',
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        InkWell(
                          onTap: _pickDateRange,
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).colorScheme.outline,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _startDate == null || _endDate == null
                                      ? 'Select Date Range'
                                      : '${DateFormat('dd MMM yyyy').format(_startDate!)} - ${DateFormat('dd MMM yyyy').format(_endDate!)}',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                const Icon(Icons.calendar_today, size: 20),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Delivery Days Section
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.outlineVariant,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_view_week,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Delivery Days',
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
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
                                final isSelected = _selectedDeliveryDays
                                    .contains(day);
                                return FilterChip(
                                  label: Text(day),
                                  selected: isSelected,
                                  onSelected: (bool selected) {
                                    setState(() {
                                      if (selected) {
                                        _selectedDeliveryDays.add(day);
                                      } else {
                                        _selectedDeliveryDays.remove(day);
                                      }
                                      _updateCartDeliveryDetails();
                                    });
                                  },
                                  selectedColor: Theme.of(
                                    context,
                                  ).colorScheme.primaryContainer,
                                  checkmarkColor: Theme.of(
                                    context,
                                  ).colorScheme.onPrimaryContainer,
                                  labelStyle: TextStyle(
                                    color: isSelected
                                        ? Theme.of(
                                            context,
                                          ).colorScheme.onPrimaryContainer
                                        : Theme.of(
                                            context,
                                          ).colorScheme.onSurface,
                                    fontWeight: isSelected
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                );
                              }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Summary Section
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Estimated Total',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            '${cartService.grandTotalPLN.toStringAsFixed(2)} PLN',
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: FilledButton(
                          onPressed:
                              (orderService.isLoading ||
                                  _startDate == null ||
                                  _endDate == null ||
                                  _selectedDeliveryDays.isEmpty ||
                                  _selectedAddress == null)
                              ? null
                              : () async {
                                  final userIri = context
                                      .read<AuthService>()
                                      .userIri;
                                  if (userIri != null) {
                                    final orderItems = cartService.cartItems
                                        .map(
                                          (item) => {
                                            'id': item.mealPlan.id,
                                            'quantity': item.quantity,
                                          },
                                        )
                                        .toList();

                                    final List<DateTime> actualDeliveryDates =
                                        [];
                                    DateTime currentDate = _startDate!;
                                    while (currentDate.isBefore(
                                      _endDate!.add(const Duration(days: 1)),
                                    )) {
                                      final String dayOfWeek = DateFormat(
                                        'EEE',
                                      ).format(currentDate);
                                      if (_selectedDeliveryDays.contains(
                                        dayOfWeek,
                                      )) {
                                        actualDeliveryDates.add(currentDate);
                                      }
                                      currentDate = currentDate.add(
                                        const Duration(days: 1),
                                      );
                                    }

                                    Future<void> attemptCreateOrder() async {
                                      try {
                                        await orderService.createOrder(
                                          customerIri: userIri,
                                          orderItems: orderItems,
                                          restaurantIri: cartService
                                              .cartItems
                                              .first
                                              .restaurantIri,
                                          deliveryDates: actualDeliveryDates,
                                          deliveryFirstName:
                                              _selectedAddress!.firstName,
                                          deliveryLastName:
                                              _selectedAddress!.lastName,
                                          deliveryPhoneNumber:
                                              _selectedAddress!.phoneNumber,
                                          deliveryStreet:
                                              _selectedAddress!.street,
                                          deliveryApartment:
                                              _selectedAddress!.apartment,
                                          deliveryCity: _selectedAddress!.city,
                                          deliveryZipCode:
                                              _selectedAddress!.zipCode,
                                        );
                                      } catch (e) {
                                        if (!context.mounted) return;
                                        UIErrorHandler.showSnackBar(
                                          context,
                                          'Failed to process order. Please retry.',
                                          isError: true,
                                          action: SnackBarAction(
                                            label: 'Retry',
                                            onPressed: attemptCreateOrder,
                                          ),
                                        );
                                      }
                                    }

                                    await attemptCreateOrder();
                                  }
                                },
                          style: FilledButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: orderService.isLoading
                              ? const SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Text(
                                  'Confirm Order',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                    ],
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
