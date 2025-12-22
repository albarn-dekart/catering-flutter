import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:catering_flutter/core/utils/date_formatter.dart';
import 'package:catering_flutter/core/app_router.dart';
import 'package:catering_flutter/core/services/auth_service.dart';
import 'package:catering_flutter/core/widgets/global_error_widget.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/features/order/services/cart_service.dart';
import 'package:catering_flutter/features/order/services/order_service.dart';
import 'package:catering_flutter/features/customer/services/address_service.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:catering_flutter/core/widgets/price_text.dart';

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
    final cartService = context.read<CartService>();

    // Set initial dates
    if (cartService.startDate != null && cartService.endDate != null) {
      _startDate = cartService.startDate;
      _endDate = cartService.endDate;
    } else {
      _startDate = _initialStartDate;
      _endDate = _initialEndDate;
    }

    // Set initial delivery days
    if (cartService.deliveryDays.isNotEmpty) {
      _selectedDeliveryDays.clear();
      _selectedDeliveryDays.addAll(cartService.deliveryDays);
    }

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
      cartService.updateDeliveryDetails(
        [],
        [],
        startDate: _startDate,
        endDate: _endDate,
      );
      return;
    }

    final List<DateTime> actualDeliveryDates = [];
    DateTime currentDate = _startDate!;
    while (currentDate.isBefore(_endDate!.add(const Duration(days: 1)))) {
      final String dayOfWeek = AppDateFormatter.dayOfWeekAbbrBackend(
        currentDate,
      ); // e.g., Mon, Tue
      if (_selectedDeliveryDays.contains(dayOfWeek)) {
        actualDeliveryDates.add(currentDate);
      }
      currentDate = currentDate.add(const Duration(days: 1));
    }
    cartService.updateDeliveryDetails(
      actualDeliveryDates,
      _selectedDeliveryDays.toList(),
      startDate: _startDate,
      endDate: _endDate,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: AppLocalizations.of(context)!.deliveryDetails,
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
                    AppLocalizations.of(context)!.yourCartIsEmpty,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            );
          }

          final addressService = context.watch<AddressService>();
          if (addressService.hasError && _selectedAddress == null) {
            return GlobalErrorWidget(
              message: addressService.errorMessage,
              onRetry: _loadDefaultAddress,
              withScaffold: false,
            );
          }

          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Address Section
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.outlineVariant,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 8.0,
                            runSpacing: 8.0,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    AppLocalizations.of(
                                      context,
                                    )!.deliveryAddress,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
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
                                  _selectedAddress == null
                                      ? AppLocalizations.of(context)!.add
                                      : AppLocalizations.of(context)!.change,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (_selectedAddress != null) ...[
                          const SizedBox(height: 8),
                          Text(
                            '${_selectedAddress!.firstName} ${_selectedAddress!.lastName}',
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(fontWeight: FontWeight.normal),
                          ),
                          Text(_selectedAddress!.street),
                          if (_selectedAddress!.apartment != null)
                            Text('Apt: ${_selectedAddress!.apartment}'),
                          Text(
                            '${_selectedAddress!.city}, ${_selectedAddress!.zipCode}',
                          ),
                          Text(_selectedAddress!.phoneNumber),
                        ] else
                          Text(
                            AppLocalizations.of(
                              context,
                            )!.pleaseSelectDeliveryAddress,
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Duration Section
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
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
                              AppLocalizations.of(context)!.orderDuration,
                              style: Theme.of(context).textTheme.titleLarge
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
                            child: SizedBox(
                              width: double.infinity,
                              child: Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 8.0,
                                runSpacing: 8.0,
                                children: [
                                  Text(
                                    _startDate == null || _endDate == null
                                        ? AppLocalizations.of(
                                            context,
                                          )!.selectDateRange
                                        : '${AppDateFormatter.shortDate(context, _startDate!)} - ${AppDateFormatter.shortDate(context, _endDate!)}',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyLarge,
                                  ),
                                  const Icon(Icons.calendar_today, size: 20),
                                ],
                              ),
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
                    borderRadius: BorderRadius.circular(24),
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
                              AppLocalizations.of(context)!.deliveryDays,
                              style: Theme.of(context).textTheme.titleLarge
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
                                // Display localized day name but use English internally
                                final localizedDay =
                                    AppDateFormatter.localizedDayName(
                                      context,
                                      day,
                                    );
                                return FilterChip(
                                  label: Text(localizedDay),
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
                                  labelStyle: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
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
                  padding: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(
                          context,
                        ).colorScheme.shadow.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, -5),
                      ),
                    ],
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  child: SafeArea(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Delivery Fee Row
                        if (cartService.deliveryPrice > 0)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.deliveryFee,
                                  style: Theme.of(context).textTheme.titleMedium
                                      ?.copyWith(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSurfaceVariant,
                                      ),
                                ),
                                PriceText.fromDouble(
                                  priceGroszy:
                                      (cartService.deliveryPrice *
                                              cartService.deliveryDates.length)
                                          .toDouble(),
                                  style: Theme.of(context).textTheme.titleMedium
                                      ?.copyWith(fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.finalTotal,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurfaceVariant,
                                  ),
                            ),
                            PriceText.fromDouble(
                              priceGroszy: cartService.grandTotalPLN,
                              style: Theme.of(context).textTheme.headlineSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
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
                                        final String dayOfWeek =
                                            AppDateFormatter.dayOfWeekAbbrBackend(
                                              currentDate,
                                            );
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
                                            deliveryCity:
                                                _selectedAddress!.city,
                                            deliveryZipCode:
                                                _selectedAddress!.zipCode,
                                          );

                                          if (!context.mounted) return;

                                          // Clear cart after successful order
                                          cartService.clearCart();

                                          // Navigate to order details
                                          if (orderService.createdOrder !=
                                              null) {
                                            context.go(
                                              Uri(
                                                path: AppRoutes.orderDetail,
                                                queryParameters: {
                                                  'id': IriHelper.getId(
                                                    orderService
                                                        .createdOrder!
                                                        .id,
                                                  ),
                                                },
                                              ).toString(),
                                              extra: orderService.createdOrder,
                                            );
                                          }
                                        } catch (e) {
                                          if (!context.mounted) return;
                                          UIErrorHandler.showSnackBar(
                                            context,
                                            AppLocalizations.of(
                                              context,
                                            )!.orderProcessFailed,
                                            isError: true,
                                            action: SnackBarAction(
                                              label: AppLocalizations.of(
                                                context,
                                              )!.retry,
                                              onPressed: attemptCreateOrder,
                                            ),
                                          );
                                        }
                                      }

                                      await attemptCreateOrder();
                                    }
                                  },
                            child: orderService.isLoading
                                ? const SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : Text(
                                    AppLocalizations.of(context)!.confirmOrder,
                                  ),
                          ),
                        ),
                      ],
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
