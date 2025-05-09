import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:bit_task/core/base_widgets/calendar_detail.dart';
import 'package:bit_task/core/extensions/date_extension.dart';
import 'package:bit_task/core/res/dimensions.dart';

//void main() => runApp(MaterialApp(home: CustomHeatmapCalendar()));

class CustomHeatmapCalendar extends StatefulWidget {
  Function? onExpendIconClicked, onSingleDateClick;

  CustomHeatmapCalendar({this.onExpendIconClicked});

  @override
  State<CustomHeatmapCalendar> createState() => _CustomHeatmapCalendarState();
}

class _CustomHeatmapCalendarState extends State<CustomHeatmapCalendar> {
  late DateTime _focusedMonth;
  late DateTime _minMonth;
  late DateTime _maxMonth;

  final Map<DateTime, int> heatmapData = {
    DateTime(2025, 4, 1): 2,
    DateTime(2025, 4, 15): 3,
    DateTime(2025, 4, 16): 6,
    DateTime(2025, 4, 17): 1,
    DateTime(2025, 5, 3): 6,
    DateTime(2025, 6, 1): 1, // Latest month with data
  };

  @override
  void initState() {
    super.initState();
    final sortedDates = heatmapData.keys.toList()..sort();
    _minMonth = DateTime(sortedDates.first.year, sortedDates.first.month);
    _maxMonth = DateTime(sortedDates.last.year, sortedDates.last.month);

    final now = DateTime.now();
    final currentMonth = DateTime(now.year, now.month);

    if (currentMonth.isBefore(_minMonth)) {
      _focusedMonth = _minMonth;
    } else {
      _focusedMonth = currentMonth;
    }
  }

  Color getDotColor(int value) {
    if (value == 0) return Colors.transparent;
    if (value < 2) return Colors.green[200]!;
    if (value < 5) return Colors.green[400]!;
    return Colors.green[700]!;
  }

  void _changeMonth(int offset) {
    final newMonth = DateTime(_focusedMonth.year, _focusedMonth.month + offset);
    if (!newMonth.isBefore(_minMonth)) {
      setState(() {
        _focusedMonth = newMonth;
      });
    }
  }

  List<Widget> buildCalendar() {
    final firstDayOfMonth =
        DateTime(_focusedMonth.year, _focusedMonth.month, 1);
    final totalDays =
        DateUtils.getDaysInMonth(_focusedMonth.year, _focusedMonth.month);
    final firstWeekday = firstDayOfMonth.weekday % 7;
    final today = DateTime.now();

    List<Widget> dayWidgets = [];

    for (int i = 0; i < firstWeekday; i++) {
      dayWidgets.add(Container());
    }

    for (int i = 1; i <= totalDays; i++) {
      final day = DateTime(_focusedMonth.year, _focusedMonth.month, i);
      final value = heatmapData[day] ?? 0;
      final dotColor = getDotColor(value);
      int dateDifference = today.getDateDifference(day);
      if (dateDifference == 0) {
        print('Today: $today , Day: $day');
      }
      dayWidgets.add(GestureDetector(
          onTap: () {
            widget.onSingleDateClick?.call(day.getWithoutTimeString());
          },
          child: CalendarDetail(
            isSelected: (dateDifference == 0) ? true : false,
            day: '$i',
            dotColor: dotColor,
          )));
    }

    return dayWidgets;
  }

  Future<void> _selectMonth() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _focusedMonth,
      firstDate: _minMonth,
      lastDate: DateTime.now().add(Duration(days: 365 * 10)),
      initialDatePickerMode: DatePickerMode.year,
      helpText: 'Select Year and Month',
    );

    if (picked != null) {
      final pickedMonth = DateTime(picked.year, picked.month);
      if (!pickedMonth.isBefore(_minMonth)) {
        setState(() {
          _focusedMonth = pickedMonth;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    final monthLabel = DateFormat.yMMMM().format(_focusedMonth);

    return
        // Scaffold(
        // //appBar: AppBar(title: Text("Custom Heatmap Calendar")),
        // body:
        Column(
      children: [
        // Month navigation
        Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.chevron_left),
                    onPressed: _focusedMonth.isAfter(_minMonth)
                        ? () => _changeMonth(-1)
                        : null,
                  ),
                  InkWell(
                      onTap: _selectMonth,
                      child: Text(monthLabel,
                          style:
                              TextStyle(fontSize: Dimensions.titleFontSize))),
                  IconButton(
                    icon: Icon(Icons.chevron_right),
                    onPressed: () => _changeMonth(1),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  widget.onExpendIconClicked?.call();
                },
                icon: Icon(Icons.keyboard_arrow_up))
          ],
        ),
        //SizedBox(height: 12),
        // Weekday headers
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: daysOfWeek
              .map((d) => Expanded(
                    child: Center(
                        child: Text(d,
                            style: TextStyle(fontWeight: FontWeight.bold))),
                  ))
              .toList(),
        ),
        SizedBox(height: 12),
        // Calendar grid
        Expanded(
          child: GridView.count(
            crossAxisCount: 7,
            children: buildCalendar(),
          ),
        ),
      ],
    );
  }
}
