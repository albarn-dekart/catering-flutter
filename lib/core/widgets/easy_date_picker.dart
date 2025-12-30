import 'package:catering_flutter/core/utils/date_formatter.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class EasyDatePicker extends StatelessWidget {
  final DateTimeRange? selectedDateRange;
  final ValueChanged<DateTimeRange?> onDateRangeChanged;
  final bool isLoading;
  final Widget? headerAction;
  final bool showAllTime;
  final bool showQuickFilters;

  const EasyDatePicker({
    super.key,
    required this.selectedDateRange,
    required this.onDateRangeChanged,
    this.isLoading = false,
    this.headerAction,
    this.showAllTime = true,
    this.showQuickFilters = true,
  });

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  bool _isSelected(DateTime date) {
    if (selectedDateRange == null) return false;
    return _isSameDay(selectedDateRange!.start, date) &&
        _isSameDay(selectedDateRange!.end, date);
  }

  void _onDateTap(DateTime date) {
    onDateRangeChanged(
      DateTimeRange(
        start: DateTime(date.year, date.month, date.day),
        end: DateTime(date.year, date.month, date.day),
      ),
    );
  }

  Future<void> _selectCustomRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      initialDateRange: selectedDateRange,
    );

    if (picked != null) {
      onDateRangeChanged(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(days: 1));
    final tomorrow = now.add(const Duration(days: 1));

    final quickDates = showQuickFilters
        ? [
            {'label': l10n.yesterday, 'date': yesterday},
            {'label': l10n.today, 'date': now},
            {'label': l10n.tomorrow, 'date': tomorrow},
          ]
        : <Map<String, Object>>[];

    return SizedBox(
      height: 48,
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // 1. Date range selector (Tune) - FIRST
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: IconButton(
                      onPressed: () => _selectCustomRange(context),
                      icon: const Icon(Icons.tune_rounded),
                      tooltip: l10n.selectDateRange,
                      style: IconButton.styleFrom(
                        padding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                        backgroundColor:
                            theme.colorScheme.surfaceContainerHighest,
                        shape: const StadiumBorder(),
                      ),
                    ),
                  ),

                  // 2. "Cały okres" button
                  if (showAllTime ||
                      (selectedDateRange != null &&
                          !quickDates.any(
                            (item) => _isSelected(item['date'] as DateTime),
                          )))
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Builder(
                        builder: (context) {
                          final isCustomSelected =
                              selectedDateRange == null ||
                              !quickDates.any(
                                (item) => _isSelected(item['date'] as DateTime),
                              );
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: isCustomSelected
                                  ? [
                                      BoxShadow(
                                        color: theme.colorScheme.primary
                                            .withValues(alpha: 0.3),
                                        blurRadius: 10,
                                        offset: const Offset(0, 4),
                                      ),
                                    ]
                                  : null,
                            ),
                            child: ChoiceChip(
                              label: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.calendar_month, size: 16),
                                  const SizedBox(width: 8),
                                  Text(
                                    selectedDateRange != null &&
                                            !quickDates.any(
                                              (item) => _isSelected(
                                                item['date'] as DateTime,
                                              ),
                                            )
                                        ? (_isSameDay(
                                                selectedDateRange!.start,
                                                selectedDateRange!.end,
                                              )
                                              ? AppDateFormatter.dayMonth(
                                                  context,
                                                  selectedDateRange!.start,
                                                )
                                              : '${AppDateFormatter.dayMonth(context, selectedDateRange!.start)} - ${AppDateFormatter.dayMonth(context, selectedDateRange!.end)}')
                                        : l10n.allTime,
                                  ),
                                ],
                              ),
                              selected: isCustomSelected,
                              onSelected: (selected) {
                                if (selectedDateRange != null &&
                                    !quickDates.any(
                                      (item) =>
                                          _isSelected(item['date'] as DateTime),
                                    )) {
                                  onDateRangeChanged(null);
                                } else {
                                  onDateRangeChanged(null);
                                }
                              },
                              visualDensity: VisualDensity.compact,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              side: isCustomSelected
                                  ? BorderSide.none
                                  : BorderSide(
                                      color: theme.colorScheme.outlineVariant
                                          .withValues(alpha: 0.5),
                                      width: 1.5,
                                    ),
                              showCheckmark: false,
                            ),
                          );
                        },
                      ),
                    ),

                  // 3. Other buttons (quick dates) - keep order as now
                  ...quickDates.map((item) {
                    final date = item['date'] as DateTime;
                    final label = item['label'] as String;
                    final isSelected = _isSelected(date);

                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: theme.colorScheme.primary.withValues(
                                      alpha: 0.3,
                                    ),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ]
                              : null,
                        ),
                        child: ChoiceChip(
                          label: Text(label),
                          selected: isSelected,
                          onSelected: (selected) {
                            if (selected) _onDateTap(date);
                          },
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          side: isSelected
                              ? BorderSide.none
                              : BorderSide(
                                  color: theme.colorScheme.outlineVariant
                                      .withValues(alpha: 0.5),
                                  width: 1.5,
                                ),
                          showCheckmark: false,
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          if (headerAction != null) ...[
            const SizedBox(width: 8),
            headerAction!,
          ],
        ],
      ),
    );
  }
}
