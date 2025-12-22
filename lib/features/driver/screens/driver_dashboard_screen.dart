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

class _DriverDashboardScreenState extends State<DriverDashboardScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedTabIndex = 0;
  final Set<String> _updatingIds = {};
  String _currentSearchQuery = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {
          _selectedTabIndex = _tabController.index;
        });
        _fetchDeliveries();
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _fetchDeliveries();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
          isLoading: userService.isLoading,
          isLoadingMore: userService.isFetchingMoreUserDeliveries,
          hasError: userService.hasError,
          errorMessage: userService.errorMessage,
          onRetry: _fetchDeliveries,
          onLoadMore: () => userService.loadMoreCurrentUserDeliveries(),
          searchHint: AppLocalizations.of(context)!.searchDriverDeliveries,
          onSearch: (query) {
            _currentSearchQuery = query;
            _fetchDeliveries();
          },

          onRefresh: _fetchDeliveries,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: Column(
              children: [
                TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 24),
                  tabs: [
                    Tab(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.local_shipping, size: 20),
                          const SizedBox(width: 8),
                          Text(AppLocalizations.of(context)!.active),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.history, size: 20),
                          const SizedBox(width: 8),
                          Text(AppLocalizations.of(context)!.history),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(height: 1, thickness: 1, indent: 0, endIndent: 0),
              ],
            ),
          ),
          itemBuilder: (context, delivery) {
            final deliveryStatus = delivery.status as Enum$DeliveryStatus;
            final address =
                '${delivery.order.deliveryStreet ?? ''}${delivery.order.deliveryApartment != null ? ', ${delivery.order.deliveryApartment}' : ''}, ${delivery.order.deliveryCity ?? ''} ${delivery.order.deliveryZipCode ?? ''}';
            final phoneNumber = delivery.order.deliveryPhoneNumber;

            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outlineVariant,
                ),
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
                            ).colorScheme.primary.withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.calendar_today_rounded,
                            size: 18,
                            color: Theme.of(context).colorScheme.primary,
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
                            ).colorScheme.secondary.withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.person_outline_rounded,
                            size: 18,
                            color: Theme.of(context).colorScheme.secondary,
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
                              ).colorScheme.primary.withValues(alpha: 0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.phone_outlined,
                              size: 18,
                              color: Theme.of(context).colorScheme.primary,
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
                              ).colorScheme.secondary.withValues(alpha: 0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.location_on_outlined,
                              size: 18,
                              color: Theme.of(context).colorScheme.secondary,
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
                          onPressed:
                              !userService.isLoading &&
                                  !_updatingIds.contains(delivery.id)
                              ? () async {
                                  setState(() {
                                    _updatingIds.add(delivery.id);
                                  });
                                  try {
                                    final updatedDelivery = await context
                                        .read<DeliveryService>()
                                        .updateDeliveryStatus(
                                          delivery.id,
                                          status: Enum$DeliveryStatus.Picked_up,
                                        );
                                    if (!context.mounted) return;

                                    if (updatedDelivery != null) {
                                      context
                                          .read<UserService>()
                                          .updateUserDelivery(updatedDelivery);
                                    } else {
                                      await _fetchDeliveries();
                                    }
                                  } catch (e) {
                                    if (!context.mounted) return;
                                    UIErrorHandler.handleError(
                                      context,
                                      e,
                                      customMessage: AppLocalizations.of(
                                        context,
                                      )!.failedToUpdateStatus,
                                    );
                                  } finally {
                                    if (mounted) {
                                      setState(() {
                                        _updatingIds.remove(delivery.id);
                                      });
                                    }
                                  }
                                }
                              : null,
                          icon: _updatingIds.contains(delivery.id)
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Icon(Icons.local_shipping),
                          label: Text(
                            AppLocalizations.of(context)!.pickUpOrder,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.normal,
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
                              onPressed:
                                  !userService.isLoading &&
                                      !_updatingIds.contains(delivery.id)
                                  ? () async {
                                      setState(() {
                                        _updatingIds.add(delivery.id);
                                      });
                                      try {
                                        final updatedDelivery = await context
                                            .read<DeliveryService>()
                                            .updateDeliveryStatus(
                                              delivery.id,
                                              status:
                                                  Enum$DeliveryStatus.Delivered,
                                            );
                                        if (!context.mounted) return;

                                        if (updatedDelivery != null) {
                                          context
                                              .read<UserService>()
                                              .updateUserDelivery(
                                                updatedDelivery,
                                              );
                                        } else {
                                          await _fetchDeliveries();
                                        }
                                      } catch (e) {
                                        if (!context.mounted) return;
                                        UIErrorHandler.handleError(
                                          context,
                                          e,
                                          customMessage: AppLocalizations.of(
                                            context,
                                          )!.failedToUpdateStatus,
                                        );
                                      } finally {
                                        if (mounted) {
                                          setState(() {
                                            _updatingIds.remove(delivery.id);
                                          });
                                        }
                                      }
                                    }
                                  : null,
                              icon: _updatingIds.contains(delivery.id)
                                  ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : const Icon(Icons.check_circle),
                              label: Text(
                                AppLocalizations.of(context)!.markAsDelivered,
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.normal,
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
                              onPressed:
                                  !userService.isLoading &&
                                      !_updatingIds.contains(delivery.id)
                                  ? () async {
                                      setState(() {
                                        _updatingIds.add(delivery.id);
                                      });
                                      try {
                                        final updatedDelivery = await context
                                            .read<DeliveryService>()
                                            .updateDeliveryStatus(
                                              delivery.id,
                                              status:
                                                  Enum$DeliveryStatus.Failed,
                                            );
                                        if (!context.mounted) return;

                                        if (updatedDelivery != null) {
                                          context
                                              .read<UserService>()
                                              .updateUserDelivery(
                                                updatedDelivery,
                                              );
                                        } else {
                                          await _fetchDeliveries();
                                        }
                                      } catch (e) {
                                        if (!context.mounted) return;
                                        UIErrorHandler.handleError(
                                          context,
                                          e,
                                          customMessage: AppLocalizations.of(
                                            context,
                                          )!.failedToUpdateStatus,
                                        );
                                      } finally {
                                        if (mounted) {
                                          setState(() {
                                            _updatingIds.remove(delivery.id);
                                          });
                                        }
                                      }
                                    }
                                  : null,
                              icon: _updatingIds.contains(delivery.id)
                                  ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : const Icon(Icons.report_problem),
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
                              onPressed:
                                  !userService.isLoading &&
                                      !_updatingIds.contains(delivery.id)
                                  ? () async {
                                      setState(() {
                                        _updatingIds.add(delivery.id);
                                      });
                                      try {
                                        final updatedDelivery = await context
                                            .read<DeliveryService>()
                                            .updateDeliveryStatus(
                                              delivery.id,
                                              status:
                                                  Enum$DeliveryStatus.Delivered,
                                            );
                                        if (!context.mounted) return;

                                        if (updatedDelivery != null) {
                                          context
                                              .read<UserService>()
                                              .updateUserDelivery(
                                                updatedDelivery,
                                              );
                                        } else {
                                          await _fetchDeliveries();
                                        }
                                      } catch (e) {
                                        if (!context.mounted) return;
                                        UIErrorHandler.handleError(
                                          context,
                                          e,
                                          customMessage: AppLocalizations.of(
                                            context,
                                          )!.failedToUpdateStatus,
                                        );
                                      } finally {
                                        if (mounted) {
                                          setState(() {
                                            _updatingIds.remove(delivery.id);
                                          });
                                        }
                                      }
                                    }
                                  : null,
                              icon: _updatingIds.contains(delivery.id)
                                  ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : const Icon(Icons.replay),
                              label: Text(
                                AppLocalizations.of(context)!.retry,
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.normal,
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
                              onPressed:
                                  !userService.isLoading &&
                                      !_updatingIds.contains(delivery.id)
                                  ? () async {
                                      setState(() {
                                        _updatingIds.add(delivery.id);
                                      });
                                      try {
                                        final updatedDelivery = await context
                                            .read<DeliveryService>()
                                            .updateDeliveryStatus(
                                              delivery.id,
                                              status:
                                                  Enum$DeliveryStatus.Returned,
                                            );
                                        if (!context.mounted) return;

                                        if (updatedDelivery != null) {
                                          context
                                              .read<UserService>()
                                              .updateUserDelivery(
                                                updatedDelivery,
                                              );
                                        } else {
                                          await _fetchDeliveries();
                                        }
                                      } catch (e) {
                                        if (!context.mounted) return;
                                        UIErrorHandler.handleError(
                                          context,
                                          e,
                                          customMessage: AppLocalizations.of(
                                            context,
                                          )!.failedToUpdateStatus,
                                        );
                                      } finally {
                                        if (mounted) {
                                          setState(() {
                                            _updatingIds.remove(delivery.id);
                                          });
                                        }
                                      }
                                    }
                                  : null,
                              icon: _updatingIds.contains(delivery.id)
                                  ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : const Icon(Icons.assignment_return),
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
