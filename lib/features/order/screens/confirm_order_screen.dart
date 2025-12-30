import 'package:flutter/material.dart';
import 'package:catering_flutter/core/widgets/app_premium_button.dart';
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
import 'package:catering_flutter/core/widgets/app_card.dart';
import 'package:catering_flutter/features/customer/widgets/address_card.dart';
import 'package:catering_flutter/core/widgets/filter_chips_bar.dart';

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
              onCancel: () {
                addressService.clearError();
                context.pop();
              },
              withScaffold: false,
            );
          }

          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Address Section
                _selectedAddress != null
                    ? AddressCard.fromAddress(
                        address: _selectedAddress!,
                        showActions: false,
                        title: AppLocalizations.of(context)!.deliveryAddress,
                        titleAction: TextButton.icon(
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
                          icon: const Icon(Icons.edit_location, size: 18),
                          label: Text(AppLocalizations.of(context)!.change),
                        ),
                        onTap: () async {
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
                      )
                    : AppCard(
                        onTap: () async {
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
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                                TextButton.icon(
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
                                  icon: const Icon(
                                    Icons.add_location,
                                    size: 18,
                                  ),
                                  label: Text(
                                    AppLocalizations.of(context)!.add,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            const Divider(),
                            const SizedBox(height: 8),
                            Center(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.add_location_alt_outlined,
                                    size: 48,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    AppLocalizations.of(
                                      context,
                                    )!.pleaseSelectDeliveryAddress,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                const SizedBox(height: 16),
                // Duration Section
                AppCard(
                  padding: const EdgeInsets.all(16),
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
                        borderRadius: BorderRadius.circular(24),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(
                                context,
                              ).colorScheme.outline.withValues(alpha: 0.3),
                            ),
                            borderRadius: BorderRadius.circular(24),
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
                                  style: Theme.of(context).textTheme.bodyLarge,
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
                const SizedBox(height: 16),
                // Delivery Days Section
                AppCard(
                  padding: const EdgeInsets.all(16),
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
                      FilterChipsBar<String>(
                        values: const [
                          'Mon',
                          'Tue',
                          'Wed',
                          'Thu',
                          'Fri',
                          'Sat',
                          'Sun',
                        ],
                        selectedValues: _selectedDeliveryDays.toList(),
                        labelBuilder: (day) =>
                            AppDateFormatter.localizedDayName(context, day),
                        onSelectedList: (newList) {
                          setState(() {
                            _selectedDeliveryDays.clear();
                            _selectedDeliveryDays.addAll(newList);
                            _updateCartDeliveryDetails();
                          });
                        },
                        padding: EdgeInsets.zero,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Summary Section
                AppCard(
                  padding: const EdgeInsets.all(16),
                  child: SafeArea(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Delivery Fee Row
                        if (cartService.deliveryPrice > 0) ...[
                          Row(
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
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                        ],
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.finalTotal,
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            PriceText.fromDouble(
                              priceGroszy: cartService.grandTotalPLN,
                              style: PriceText.standardStyle(context),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: AppPremiumButton(
                            onPressed:
                                (_startDate == null ||
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
                            isLoading: orderService.isLoading,
                            icon: Icons.check_circle,
                            label: AppLocalizations.of(context)!.confirmOrder,
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
