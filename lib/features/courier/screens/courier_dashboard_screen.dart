import 'package:catering_flutter/core/widgets/app_outlined_button.dart';
import 'package:catering_flutter/core/widgets/app_card.dart';
import 'package:catering_flutter/core/widgets/app_premium_button.dart';
import 'package:catering_flutter/features/courier/widgets/undo_timer_button.dart';
import 'package:catering_flutter/features/customer/widgets/address_card.dart';
import 'package:catering_flutter/graphql/schema.graphql.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/features/courier/services/delivery_service.dart';
import 'package:catering_flutter/features/user/services/user_service.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/utils/status_extensions.dart';
import 'package:catering_flutter/core/widgets/searchable_list_screen.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:catering_flutter/core/widgets/nutrient_row.dart';
import 'package:catering_flutter/core/widgets/icon_badge.dart';
import 'package:catering_flutter/core/widgets/easy_date_picker.dart';

class CourierDashboardScreen extends StatefulWidget {
  const CourierDashboardScreen({super.key});

  @override
  State<CourierDashboardScreen> createState() => _CourierDashboardScreenState();
}

class _CourierDashboardScreenState extends State<CourierDashboardScreen> {
  final Set<String> _updatingIds = {};
  String _currentSearchQuery = '';
  DateTimeRange? _selectedDateRange;
  Map<String, int>? _deliveryStats;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _selectedDateRange = DateTimeRange(
      start: DateTime(now.year, now.month, now.day),
      end: DateTime(now.year, now.month, now.day),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _fetchDeliveries();
    });
  }

  Future<void> _fetchDeliveryStats() async {
    try {
      final stats = await context.read<DeliveryService>().getDeliveryStats(
        dateRange: _selectedDateRange,
      );
      setState(() => _deliveryStats = stats);
    } catch (e) {
      // Silently fail - we'll fallback to loaded items
      print('Failed to fetch delivery stats: $e');
      setState(() => _deliveryStats = null);
    }
  }

  Future<void> _fetchDeliveries() async {
    final statuses = [
      Enum$DeliveryStatus.Assigned,
      Enum$DeliveryStatus.Picked_up,
      Enum$DeliveryStatus.Failed,
      Enum$DeliveryStatus.Delivered,
      Enum$DeliveryStatus.Returned,
    ];

    // Always fetch in chronological order for consistency
    final sortOrder = Input$DeliveryFilter_order(deliveryDate: 'ASC');

    await context.read<UserService>().fetchCurrentUserWithDeliveries(
      statuses: statuses,
      searchQuery: _currentSearchQuery,
      sortOrder: sortOrder,
      dateRange: _selectedDateRange,
    );

    await _fetchDeliveryStats();
  }

  bool _isUndoable(dynamic delivery) {
    if (delivery.statusUpdatedAt == null) return false;
    final updatedAt = DateTime.parse(
      delivery.statusUpdatedAt as String,
    ).toLocal();
    final now = DateTime.now().toLocal();
    final diff = now.difference(updatedAt).inSeconds;
    return diff >= 0 && diff < 60;
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

  bool get _isSingleDay {
    if (_selectedDateRange == null) return false;
    return _selectedDateRange!.start.year == _selectedDateRange!.end.year &&
        _selectedDateRange!.start.month == _selectedDateRange!.end.month &&
        _selectedDateRange!.start.day == _selectedDateRange!.end.day;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserService>(
      builder: (context, userService, child) {
        return SearchableListScreen<dynamic>(
          title: AppLocalizations.of(context)!.courierDashboard,
          items: _getSortedItems(userService.userDeliveries),
          isLoading: userService.isLoading,
          isLoadingMore: userService.isFetchingMoreUserDeliveries,
          totalItems: userService.totalUserDeliveries,
          hasError: userService.hasError,
          errorMessage: userService.errorMessage,
          onRetry: _fetchDeliveries,
          onLoadMore: () => userService.loadMoreCurrentUserDeliveries(),
          searchHint: AppLocalizations.of(context)!.searchCourierDeliveries,
          onSearch: (query) {
            _currentSearchQuery = query;
            _fetchDeliveries();
          },

          onRefresh: _fetchDeliveries,

          header: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Always show progress summary
              if (userService.userDeliveries.isNotEmpty)
                _buildProgressSummary(userService.userDeliveries),
              EasyDatePicker(
                selectedDateRange: _selectedDateRange,
                onDateRangeChanged: (range) async {
                  setState(() {
                    _selectedDateRange = range;
                    _deliveryStats = null; // Clear stats when date changes
                  });
                  await _fetchDeliveries();
                },
                isLoading: userService.isLoading,
                showQuickFilters: true,
              ),
            ],
          ),
          itemBuilder: (context, delivery) {
            final deliveryStatus = delivery.status as Enum$DeliveryStatus;
            final isDone =
                deliveryStatus == Enum$DeliveryStatus.Delivered ||
                deliveryStatus == Enum$DeliveryStatus.Returned;
            final canUndo =
                isDone || deliveryStatus == Enum$DeliveryStatus.Failed;
            final address =
                '${delivery.order.deliveryStreet ?? ''}${delivery.order.deliveryApartment != null ? ', ${delivery.order.deliveryApartment}' : ''}, ${delivery.order.deliveryCity ?? ''} ${delivery.order.deliveryZipCode ?? ''}';
            final phoneNumber = delivery.order.deliveryPhoneNumber;

            final deliveryDate = DateTime.parse(delivery.deliveryDate);
            final deliveryDateNormalized = DateTime(
              deliveryDate.year,
              deliveryDate.month,
              deliveryDate.day,
            );
            final now = DateTime.now();
            final today = DateTime(now.year, now.month, now.day);
            final isFuture = deliveryDateNormalized.isAfter(today);

            final theme = Theme.of(context);
            final undoable = _isUndoable(delivery);

            return Opacity(
              key: ValueKey(delivery.id),
              opacity: isDone && _isSingleDay && !undoable ? 0.6 : 1.0,
              child: AppCard(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            if (isDone && _isSingleDay)
                              const Icon(
                                Icons.check_circle,
                                color: Colors.green,
                                size: 20,
                              ),
                            if (isDone && _isSingleDay)
                              const SizedBox(width: 8),
                            Text(
                              AppLocalizations.of(context)!.delivery,
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                decoration: isDone && _isSingleDay
                                    ? TextDecoration.lineThrough
                                    : null,
                              ),
                            ),
                            const SizedBox(width: 8),
                            IconBadge(
                              text: IriHelper.getId(delivery.id),
                              icon: Icons.tag,
                            ),
                          ],
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
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: deliveryStatus.onContainerColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    AddressCard(
                      firstName: delivery.order.deliveryFirstName ?? '',
                      lastName: delivery.order.deliveryLastName ?? '',
                      street: delivery.order.deliveryStreet ?? '',
                      apartment: delivery.order.deliveryApartment,
                      city: delivery.order.deliveryCity ?? '',
                      zipCode: delivery.order.deliveryZipCode ?? '',
                      phoneNumber: phoneNumber,
                      deliveryDate: DateTime.parse(delivery.deliveryDate),
                      onAddressTap: () => _launchMap(address),
                      withCardDecoration: false,
                      showActions: false,
                      showDefaultBadge: false,
                      enablePhoneAction: true,
                    ),
                    const SizedBox(height: 12),
                    Theme(
                      data: Theme.of(
                        context,
                      ).copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        title: Row(
                          children: [
                            Text(
                              AppLocalizations.of(context)!.orderDetails,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            IconBadge(
                              text: IriHelper.getId(delivery.order!.id),
                              icon: Icons.tag,
                            ),
                          ],
                        ),
                        leading: Icon(
                          Icons.inventory_2,
                          color: theme.colorScheme.primary,
                        ),
                        tilePadding: EdgeInsets.zero,
                        childrenPadding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 8,
                        ),
                        children: [
                          if (delivery.order.orderItems?.edges != null) ...[
                            Builder(
                              builder: (context) {
                                final mealAggregates = <String, int>{};
                                final mealDetails = <String, dynamic>{};
                                final legacyPlans = <Map<String, dynamic>>[];

                                for (var edge
                                    in delivery.order.orderItems!.edges!) {
                                  final item = edge!.node;
                                  final meals = item.mealPlan.meals?.edges;

                                  if (meals != null && meals.isNotEmpty) {
                                    for (var mealEdge in meals) {
                                      final meal = mealEdge!.node;
                                      final currentQty =
                                          mealAggregates[meal.id] ?? 0;
                                      mealAggregates[meal.id] =
                                          (currentQty + item.quantity).toInt();
                                      mealDetails[meal.id] = meal;
                                    }
                                  } else {
                                    legacyPlans.add({
                                      'plan': item.mealPlan,
                                      'quantity': item.quantity.toInt(),
                                    });
                                  }
                                }

                                return Column(
                                  children: [
                                    ...mealAggregates.entries.map((e) {
                                      final meal = mealDetails[e.key];
                                      final qty = e.value;
                                      final name = meal.name;
                                      final calories = meal.calories;
                                      final protein = meal.protein;
                                      final fat = meal.fat;
                                      final carbs = meal.carbs;

                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 12,
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .surfaceContainerHighest,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Icon(
                                                Icons.fastfood,
                                                size: 20,
                                                color:
                                                    theme.colorScheme.primary,
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    name,
                                                    style: Theme.of(
                                                      context,
                                                    ).textTheme.bodyLarge,
                                                  ),
                                                  const SizedBox(height: 4),
                                                  NutrientRow(
                                                    calories: calories,
                                                    protein: protein,
                                                    fat: fat,
                                                    carbs: carbs,
                                                    compact: true,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  AppLocalizations.of(
                                                    context,
                                                  )!.piecesCount(qty),
                                                  style: theme
                                                      .textTheme
                                                      .bodySmall
                                                      ?.copyWith(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onSurfaceVariant,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                    ...legacyPlans.map((e) {
                                      final plan = e['plan'];
                                      final qty = e['quantity'] as int;

                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 12,
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .surfaceContainerHighest,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Icon(
                                                Icons.inventory_2,
                                                size: 20,
                                                color:
                                                    theme.colorScheme.primary,
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    plan.name,
                                                    style: Theme.of(
                                                      context,
                                                    ).textTheme.bodyLarge,
                                                  ),
                                                  const SizedBox(height: 4),
                                                  NutrientRow(
                                                    calories: plan.calories,
                                                    protein: plan.protein,
                                                    fat: plan.fat,
                                                    carbs: plan.carbs,
                                                    compact: true,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  AppLocalizations.of(
                                                    context,
                                                  )!.piecesCount(qty),
                                                  style: theme
                                                      .textTheme
                                                      .bodySmall
                                                      ?.copyWith(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onSurfaceVariant,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                  ],
                                );
                              },
                            ),
                          ],
                        ],
                      ),
                    ),
                    if (isFuture) ...[
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: theme.colorScheme.outlineVariant,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.info_outline,
                              size: 20,
                              color: theme.colorScheme.primary,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                AppLocalizations.of(
                                  context,
                                )!.futureDeliveryNoActions,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    const SizedBox(height: 24),
                    if (!isFuture) ...[
                      if (deliveryStatus == Enum$DeliveryStatus.Assigned)
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: AppPremiumButton(
                            onPressed: () async {
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
                                  await _fetchDeliveryStats();
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
                            },
                            isLoading: _updatingIds.contains(delivery.id),
                            icon: Icons.local_shipping,
                            label: AppLocalizations.of(context)!.pickUpOrder,
                          ),
                        ),
                      if (deliveryStatus == Enum$DeliveryStatus.Picked_up)
                        Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 48,
                              child: AppPremiumButton(
                                onPressed: () async {
                                  setState(() {
                                    _updatingIds.add(delivery.id);
                                  });
                                  try {
                                    final updatedDelivery = await context
                                        .read<DeliveryService>()
                                        .updateDeliveryStatus(
                                          delivery.id,
                                          status: Enum$DeliveryStatus.Delivered,
                                        );
                                    if (!context.mounted) return;

                                    if (updatedDelivery != null) {
                                      context
                                          .read<UserService>()
                                          .updateUserDelivery(updatedDelivery);
                                      await _fetchDeliveryStats();
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
                                },
                                isLoading: _updatingIds.contains(delivery.id),
                                icon: Icons.check_circle,
                                label: AppLocalizations.of(
                                  context,
                                )!.markAsDelivered,
                              ),
                            ),
                            const SizedBox(height: 12),
                            AppOutlinedButton(
                              onPressed: () async {
                                setState(() {
                                  _updatingIds.add(delivery.id);
                                });
                                try {
                                  final updatedDelivery = await context
                                      .read<DeliveryService>()
                                      .updateDeliveryStatus(
                                        delivery.id,
                                        status: Enum$DeliveryStatus.Failed,
                                      );
                                  if (!context.mounted) return;

                                  if (updatedDelivery != null) {
                                    context.read<UserService>().updateUserDelivery(
                                      updatedDelivery,
                                    );
                                    await _fetchDeliveryStats();
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
                              },
                              isLoading: _updatingIds.contains(delivery.id),
                              icon: Icons.report_problem,
                              label: AppLocalizations.of(context)!.actionReportIssue,
                              color: theme.colorScheme.error,
                            ),
                          ],
                        ),

                      if (deliveryStatus == Enum$DeliveryStatus.Failed)
                        AppOutlinedButton(
                          onPressed: () async {
                            setState(() {
                              _updatingIds.add(delivery.id);
                            });
                            try {
                              final updatedDelivery = await context
                                  .read<DeliveryService>()
                                  .updateDeliveryStatus(
                                    delivery.id,
                                    status: Enum$DeliveryStatus.Returned,
                                  );
                              if (!context.mounted) return;

                              if (updatedDelivery != null) {
                                context.read<UserService>().updateUserDelivery(
                                  updatedDelivery,
                                );
                                await _fetchDeliveryStats();
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
                          },
                          isLoading: _updatingIds.contains(delivery.id),
                          icon: Icons.assignment_return,
                          label: AppLocalizations.of(context)!.actionReturnToRestaurant,
                        ),

                      if (canUndo && delivery.statusUpdatedAt != null)
                        UndoTimerButton(
                          statusUpdatedAt: delivery.statusUpdatedAt as String,
                          isUpdating: _updatingIds.contains(delivery.id),
                          onExpired: () => setState(() {}),
                          onUndo: () async {
                            setState(() => _updatingIds.add(delivery.id));
                            try {
                              final updated = await context
                                  .read<DeliveryService>()
                                  .updateDeliveryStatus(
                                    delivery.id,
                                    status: Enum$DeliveryStatus.Picked_up,
                                  );
                              if (!context.mounted) return;
                              if (updated != null) {
                                context.read<UserService>().updateUserDelivery(
                                  updated,
                                );
                                await _fetchDeliveryStats();
                                if (!context.mounted) return;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      AppLocalizations.of(
                                        context,
                                      )!.revertStatusSuccess,
                                    ),
                                  ),
                                );
                              }
                            } catch (e) {
                              if (!context.mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    AppLocalizations.of(
                                      context,
                                    )!.revertStatusFailed,
                                  ),
                                ),
                              );
                            } finally {
                              if (mounted) {
                                setState(
                                  () => _updatingIds.remove(delivery.id),
                                );
                              }
                            }
                          },
                        ),
                    ],
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  List<dynamic> _getSortedItems(List<dynamic> items) {
    final sortedList = List<dynamic>.from(items);

    sortedList.sort((a, b) {
      // 1. Primary sort: Delivery date/time (chronological)
      final dateA = DateTime.parse(a.deliveryDate);
      final dateB = DateTime.parse(b.deliveryDate);
      final dateComparison = dateA.compareTo(dateB);
      if (dateComparison != 0) return dateComparison;

      // 2. Secondary sort: Status priority (active/in-progress first)
      Enum$DeliveryStatus getEffectiveStatus(dynamic d) {
        final status = d.status as Enum$DeliveryStatus;
        if (_isUndoable(d)) {
          // If it was just marked as Delivered or Failed, it was Picked_up before
          if (status == Enum$DeliveryStatus.Delivered ||
              status == Enum$DeliveryStatus.Failed) {
            return Enum$DeliveryStatus.Picked_up;
          }
          // If it was just marked as Returned, it was likely Failed before
          if (status == Enum$DeliveryStatus.Returned) {
            return Enum$DeliveryStatus.Failed;
          }
        }
        return status;
      }

      final statusA = getEffectiveStatus(a);
      final statusB = getEffectiveStatus(b);

      final statusPriority = {
        Enum$DeliveryStatus.Assigned: 1,
        Enum$DeliveryStatus.Picked_up: 2,
        Enum$DeliveryStatus.Failed: 3,
        Enum$DeliveryStatus.Delivered: 4,
        Enum$DeliveryStatus.Returned: 5,
      };

      final priorityA = statusPriority[statusA] ?? 6;
      final priorityB = statusPriority[statusB] ?? 6;
      final statusComparison = priorityA.compareTo(priorityB);
      if (statusComparison != 0) return statusComparison;

      // 3. Tertiary sort: By ID (newest first as fallback)
      return b.id.compareTo(a.id);
    });

    // For single day view, we might want upcoming deliveries first
    // but this is now handled by the chronological date sorting
    return sortedList;
  }

  Widget _buildProgressSummary(List items) {
    final total = _deliveryStats?['total'] ?? items.length;
    final completed =
        _deliveryStats?['completed'] ??
        items.where((i) {
          final status = i.status as Enum$DeliveryStatus;
          return status == Enum$DeliveryStatus.Delivered ||
              status == Enum$DeliveryStatus.Returned ||
              status == Enum$DeliveryStatus.Failed;
        }).length;

    final progress = total > 0 ? completed / total : 0.0;
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    // Create appropriate label based on date range
    String label;
    if (_selectedDateRange == null) {
      label = l10n.allTimeProgress(completed, total);
    } else if (_isSingleDay) {
      label = l10n.dailyProgress(completed, total);
    } else {
      label = l10n.rangeProgress(completed, total);
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: theme.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
            Text(
              '${(progress * 100).toInt()}%',
              style: theme.textTheme.labelMedium,
            ),
          ],
        ),
        const SizedBox(height: 4),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 6,
            backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.1),
            valueColor: AlwaysStoppedAnimation<Color>(
              theme.colorScheme.primary,
            ),
          ),
        ),
        // Show note if using loaded items instead of stats
        if (_deliveryStats == null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              l10n.showingXofY(items.length, total),
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        const SizedBox(height: 4),
      ],
    );
  }
}
