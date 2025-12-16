import 'package:catering_flutter/graphql/schema.graphql.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/utils/date_formatter.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/features/driver/services/delivery_service.dart';
import 'package:catering_flutter/features/user/services/user_service.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/utils/status_extensions.dart';
import 'package:catering_flutter/core/widgets/searchable_list_screen.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';

class DriverDashboardScreen extends StatefulWidget {
  const DriverDashboardScreen({super.key});

  @override
  State<DriverDashboardScreen> createState() => _DriverDashboardScreenState();
}

class _DriverDashboardScreenState extends State<DriverDashboardScreen> {
  int _selectedTabIndex = 0;

  String _currentSearchQuery = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _fetchDeliveries();
      if (!mounted) return;
      final service = context.read<UserService>();
      if (service.hasError) {
        UIErrorHandler.showSnackBar(
          context,
          service.errorMessage!,
          isError: true,
        );
      }
    });
  }

  Future<void> _fetchDeliveries() async {
    final statuses = _selectedTabIndex == 0
        ? [
            Enum$DeliveryStatus.Assigned,
            Enum$DeliveryStatus.Picked_up,
            Enum$DeliveryStatus.Failed,
          ]
        : [Enum$DeliveryStatus.Delivered, Enum$DeliveryStatus.Returned];

    Input$DeliveryFilter_order? sortOrder;
    if (_selectedTabIndex == 1) {
      // History
      sortOrder = Input$DeliveryFilter_order(deliveryDate: 'DESC');
    } else {
      // Active
      sortOrder = Input$DeliveryFilter_order(deliveryDate: 'ASC');
    }

    await context.read<UserService>().fetchCurrentUserWithDeliveries(
      statuses: statuses,
      searchQuery: _currentSearchQuery,
      sortOrder: sortOrder,
    );
  }

  Future<void> _launchMap(String address) async {
    final query = Uri.encodeComponent(address);
    final googleMapsUrl = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$query',
    );

    try {
      await launchUrl(googleMapsUrl, mode: LaunchMode.externalApplication);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.couldNotLaunchMap),
          ),
        );
      }
    }
  }

  Future<void> _launchPhone(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    try {
      await launchUrl(launchUri);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.couldNotLaunchPhone),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserService>(
      builder: (context, userService, child) {
        return SearchableListScreen<dynamic>(
          title: AppLocalizations.of(context)!.driverDashboard,
          items: userService.userDeliveries,
          isLoading:
              userService.isLoading || userService.isFetchingMoreUserDeliveries,
          onLoadMore: () => userService.loadMoreCurrentUserDeliveries(),
          searchHint: AppLocalizations.of(context)!.searchDriverDeliveries,
          onSearch: (query) {
            _currentSearchQuery = query;
            _fetchDeliveries();
          },

          onRefresh: _fetchDeliveries,
          customFilters: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: SizedBox(
              width: double.infinity,
              child: SegmentedButton<int>(
                segments: [
                  ButtonSegment<int>(
                    value: 0,
                    label: Text(AppLocalizations.of(context)!.active),
                    icon: const Icon(Icons.local_shipping),
                  ),
                  ButtonSegment<int>(
                    value: 1,
                    label: Text(AppLocalizations.of(context)!.history),
                    icon: const Icon(Icons.history),
                  ),
                ],
                selected: {_selectedTabIndex},
                onSelectionChanged: (Set<int> newSelection) {
                  setState(() {
                    _selectedTabIndex = newSelection.first;
                  });
                  _fetchDeliveries();
                },
              ),
            ),
          ),
          itemBuilder: (context, delivery) {
            final deliveryStatus = delivery.status as Enum$DeliveryStatus;
            final address =
                '${delivery.order.deliveryStreet ?? ''}${delivery.order.deliveryApartment != null ? ', ${delivery.order.deliveryApartment}' : ''}, ${delivery.order.deliveryCity ?? ''} ${delivery.order.deliveryZipCode ?? ''}';
            final phoneNumber = delivery.order.deliveryPhoneNumber;

            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(
                            context,
                          )!.orderNumber(IriHelper.getId(delivery.order.id)),
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: deliveryStatus.containerColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            deliveryStatus.getLabel(context),
                            style: Theme.of(context).textTheme.labelMedium
                                ?.copyWith(
                                  color: deliveryStatus.onContainerColor,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).colorScheme.surfaceContainerHighest,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.calendar_today,
                            size: 20,
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          '${AppLocalizations.of(context)!.deliveryDate}: ${AppDateFormatter.shortDate(context, DateTime.parse(delivery.deliveryDate))}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).colorScheme.surfaceContainerHighest,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.person,
                            size: 20,
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            AppLocalizations.of(context)!.customerName(
                              '${delivery.order.deliveryFirstName ?? ''} ${delivery.order.deliveryLastName ?? ''}',
                            ),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    InkWell(
                      onTap: phoneNumber != null
                          ? () => _launchPhone(phoneNumber)
                          : null,
                      borderRadius: BorderRadius.circular(8),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).colorScheme.surfaceContainerHighest,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.phone,
                              size: 20,
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              '${AppLocalizations.of(context)!.phone}: ${phoneNumber ?? 'N/A'}',
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(
                                    color: phoneNumber != null
                                        ? Theme.of(context).colorScheme.primary
                                        : null,
                                    decoration: phoneNumber != null
                                        ? TextDecoration.underline
                                        : null,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    InkWell(
                      onTap: () => _launchMap(address),
                      borderRadius: BorderRadius.circular(8),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).colorScheme.surfaceContainerHighest,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.location_on,
                              size: 20,
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              address,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    ExpansionTile(
                      title: Text(AppLocalizations.of(context)!.orderDetails),
                      children: [
                        if (delivery.order.orderItems?.edges != null)
                          ...delivery.order.orderItems!.edges!.map((edge) {
                            final item = edge!.node;
                            return ListTile(
                              title: Text(item.mealPlan.name),
                              trailing: CircleAvatar(
                                radius: 12,
                                child: Text(
                                  '${item.quantity}',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                            );
                          }),
                      ],
                    ),
                    const SizedBox(height: 24),
                    if (deliveryStatus == Enum$DeliveryStatus.Assigned)
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: FilledButton.icon(
                          onPressed: !userService.isLoading
                              ? () async {
                                  try {
                                    await context
                                        .read<DeliveryService>()
                                        .updateDeliveryStatus(
                                          delivery.id,
                                          status: Enum$DeliveryStatus.Picked_up,
                                        );
                                    if (!context.mounted) return;

                                    await _fetchDeliveries();
                                  } catch (e) {
                                    if (!context.mounted) return;
                                    UIErrorHandler.handleError(
                                      context,
                                      e,
                                      customMessage: AppLocalizations.of(
                                        context,
                                      )!.failedToUpdateStatus,
                                    );
                                  }
                                }
                              : null,
                          icon: const Icon(Icons.local_shipping),
                          label: Text(
                            AppLocalizations.of(context)!.pickUpOrder,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimary,
                                ),
                          ),
                          style: FilledButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                    if (deliveryStatus == Enum$DeliveryStatus.Picked_up)
                      Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: FilledButton.icon(
                              onPressed: !userService.isLoading
                                  ? () async {
                                      try {
                                        await context
                                            .read<DeliveryService>()
                                            .updateDeliveryStatus(
                                              delivery.id,
                                              status:
                                                  Enum$DeliveryStatus.Delivered,
                                            );
                                        if (!context.mounted) return;

                                        await _fetchDeliveries();
                                      } catch (e) {
                                        if (!context.mounted) return;
                                        UIErrorHandler.handleError(
                                          context,
                                          e,
                                          customMessage: AppLocalizations.of(
                                            context,
                                          )!.failedToUpdateStatus,
                                        );
                                      }
                                    }
                                  : null,
                              icon: const Icon(Icons.check_circle),
                              label: Text(
                                AppLocalizations.of(context)!.markAsDelivered,
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onPrimary,
                                    ),
                              ),
                              style: FilledButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: OutlinedButton.icon(
                              onPressed: !userService.isLoading
                                  ? () async {
                                      try {
                                        await context
                                            .read<DeliveryService>()
                                            .updateDeliveryStatus(
                                              delivery.id,
                                              status:
                                                  Enum$DeliveryStatus.Failed,
                                            );
                                        if (!context.mounted) return;

                                        await _fetchDeliveries();
                                      } catch (e) {
                                        if (!context.mounted) return;
                                        UIErrorHandler.handleError(
                                          context,
                                          e,
                                          customMessage: AppLocalizations.of(
                                            context,
                                          )!.failedToUpdateStatus,
                                        );
                                      }
                                    }
                                  : null,
                              icon: const Icon(Icons.report_problem),
                              label: Text(
                                AppLocalizations.of(context)!.actionReportIssue,
                              ),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Theme.of(
                                  context,
                                ).colorScheme.error,
                                side: BorderSide(
                                  color: Theme.of(context).colorScheme.error,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    if (deliveryStatus == Enum$DeliveryStatus.Failed)
                      Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: FilledButton.icon(
                              onPressed: !userService.isLoading
                                  ? () async {
                                      try {
                                        await context
                                            .read<DeliveryService>()
                                            .updateDeliveryStatus(
                                              delivery.id,
                                              status:
                                                  Enum$DeliveryStatus.Delivered,
                                            );
                                        if (!context.mounted) return;

                                        await _fetchDeliveries();
                                      } catch (e) {
                                        if (!context.mounted) return;
                                        UIErrorHandler.handleError(
                                          context,
                                          e,
                                          customMessage: AppLocalizations.of(
                                            context,
                                          )!.failedToUpdateStatus,
                                        );
                                      }
                                    }
                                  : null,
                              icon: const Icon(Icons.replay),
                              label: Text(
                                AppLocalizations.of(context)!.retry,
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onPrimary,
                                    ),
                              ),
                              style: FilledButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: OutlinedButton.icon(
                              onPressed: !userService.isLoading
                                  ? () async {
                                      try {
                                        await context
                                            .read<DeliveryService>()
                                            .updateDeliveryStatus(
                                              delivery.id,
                                              status:
                                                  Enum$DeliveryStatus.Returned,
                                            );
                                        if (!context.mounted) return;

                                        await _fetchDeliveries();
                                      } catch (e) {
                                        if (!context.mounted) return;
                                        UIErrorHandler.handleError(
                                          context,
                                          e,
                                          customMessage: AppLocalizations.of(
                                            context,
                                          )!.failedToUpdateStatus,
                                        );
                                      }
                                    }
                                  : null,
                              icon: const Icon(Icons.assignment_return),
                              label: Text(
                                AppLocalizations.of(
                                  context,
                                )!.actionReturnToRestaurant,
                              ),
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
