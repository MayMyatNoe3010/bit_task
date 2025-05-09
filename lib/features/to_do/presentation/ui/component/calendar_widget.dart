import 'package:flutter/material.dart';
import 'package:bit_task/core/base_widgets/custom_horizontal_calendar.dart';

import '../../../../../core/base_widgets/custom_heat_map_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  bool _isExpended = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        height: _isExpended ? 350 : 150,
        child: _isExpended
            ? CustomHeatmapCalendar(
                onExpendIconClicked: () {
                  setState(() {
                    _isExpended = !_isExpended;
                  });
                },
              )
            : CustomHorizontalCalendar(
                onExpendIconClicked: () {
                  setState(() {
                    _isExpended = !_isExpended;
                  });
                },
              ));
  }
}
