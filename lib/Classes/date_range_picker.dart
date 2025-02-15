import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:catering_app/Classes/app_theme.dart';

class DateRangePicker extends StatefulWidget {
  final void Function(
          DateTime startDate, DateTime endDate, List<int> deliveryDays)
      onDateSelected;

  final DateTime? startDate;
  final DateTime? endDate;
  final List<int> deliveryDays;

  const DateRangePicker(
      {super.key,
      required this.onDateSelected,
      required this.deliveryDays,
      this.startDate,
      this.endDate});

  @override
  State<DateRangePicker> createState() => _DateRangePickerState();

  static DateTime getNextDeliveryDay(
      DateTime currentDate, List<int> deliveryDays) {
    int currentDay = currentDate.weekday;

    int daysToAdd = 0;
    while (!deliveryDays.contains((currentDay + daysToAdd - 1) % 7 + 1)) {
      daysToAdd++;
    }
    return currentDate.add(Duration(days: daysToAdd));
  }

  static String dayOfWeekToString(int day) {
    const days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    return days[day - 1];
  }

  static int countDeliveryDays(
      DateTime? startDate, DateTime? endDate, List<int> deliveryDays) {
    int count = 0;

    if (startDate == null || endDate == null || deliveryDays.isEmpty) return 0;

    for (DateTime date = startDate;
        date.isBefore(endDate) || date.isAtSameMomentAs(endDate);
        date = date.add(const Duration(days: 1))) {
      if (deliveryDays.contains(date.weekday)) count++;
    }

    return count;
  }
}

class _DateRangePickerState extends State<DateRangePicker> {
  DateTime? _startDate;
  DateTime? _endDate;
  late List<int> _deliveryDays;

  @override
  void initState() {
    super.initState();
    _startDate = widget.startDate;
    _endDate = widget.endDate;
    _deliveryDays = widget.deliveryDays;
  }

  void _toggleDeliveryDay(int day) {
    setState(() {
      if (_deliveryDays.contains(day)) {
        _deliveryDays.remove(day);
      } else {
        _deliveryDays.add(day);
      }
      _deliveryDays.sort();

      // Trigger the callback if dates are selected
      if (_startDate != null && _endDate != null) {
        widget.onDateSelected(_startDate!, _endDate!, _deliveryDays);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(AppTheme.defaultPadding),
            child: Column(
              children: [
                Text(
                  'Select Delivery Days',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: AppTheme.defaultPadding),
                WeekdayToggle(
                  deliveryDays: _deliveryDays,
                  onToggle: _toggleDeliveryDay,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppTheme.defaultPadding),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(AppTheme.defaultPadding),
            child: TableCalendar(
              firstDay: DateTime.now().add(const Duration(days: 1)),
              lastDay: DateTime.utc(DateTime.now().year + 1,
                  DateTime.now().month, DateTime.now().day),
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                headerPadding:
                    EdgeInsets.symmetric(vertical: AppTheme.defaultPadding),
              ),
              focusedDay: DateTime.now().add(const Duration(days: 1)),
              startingDayOfWeek: StartingDayOfWeek.monday,
              selectedDayPredicate: (day) {
                if (_startDate != null && _endDate != null) {
                  if (_startDate?.day == _endDate?.day) {
                    return day.day == _startDate?.day;
                  }
                  return day.isAfter(
                          _startDate!.subtract(const Duration(days: 1))) &&
                      day.isBefore(_endDate!.add(const Duration(days: 1))) &&
                      _deliveryDays.contains(day.weekday);
                }
                return day == _startDate || day == _endDate;
              },
              onDaySelected: (selectedDay, _) {
                if (!_deliveryDays.contains(selectedDay.weekday)) return;

                setState(() {
                  if (_startDate == null ||
                      (_startDate != null && _endDate != null)) {
                    _startDate = selectedDay;
                    _endDate = null;
                  } else if (_endDate == null) {
                    if (selectedDay.isBefore(_startDate!)) {
                      _endDate = _startDate;
                      _startDate = selectedDay;
                    } else {
                      _endDate = selectedDay;
                    }
                  }

                  // If both dates are selected, trigger the callback
                  if (_startDate != null && _endDate != null) {
                    widget.onDateSelected(
                      _startDate!,
                      _endDate!,
                      _deliveryDays,
                    );
                  }
                });
              },
              calendarStyle: CalendarStyle(
                disabledTextStyle: const TextStyle(color: Colors.grey),
                selectedDecoration: const BoxDecoration(
                  color: AppTheme.primaryColor,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: AppTheme.primaryColor.withValues(alpha:0.2),
                  shape: BoxShape.circle,
                ),
                outsideDaysVisible: false,
              ),
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, focusedDay) {
                  if (!_deliveryDays.contains(day.weekday)) {
                    return Center(
                      child: Text(
                        '${day.day}',
                      ),
                    );
                  }
                  return null;
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class WeekdayToggle extends StatelessWidget {
  final List<int> deliveryDays;
  final ValueChanged<int> onToggle;
  final List<String> _dayLabels = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun'
  ];

  WeekdayToggle(
      {super.key, required this.deliveryDays, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: List.generate(7, (index) {
        int day = index + 1;
        bool isSelected = deliveryDays.contains(day);

        return FilterChip(
          label: Text(_dayLabels[index]),
          selected: isSelected,
          onSelected: (selected) => onToggle(day),
          selectedColor: AppTheme.primaryColor,
          checkmarkColor: Colors.white,
          backgroundColor: Colors.grey[200],
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
          ),
        );
      }),
    );
  }
}
