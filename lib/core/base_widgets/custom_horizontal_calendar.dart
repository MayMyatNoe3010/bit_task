import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:bit_task/core/base_widgets/calendar_detail.dart';
import 'package:bit_task/core/base_widgets/custom_heat_map_calendar.dart';
import 'package:bit_task/core/extensions/date_extension.dart';
import 'package:bit_task/core/res/dimensions.dart';
import 'package:bit_task/core/utils/constants.dart';

class CustomHorizontalCalendar extends StatefulWidget {
  Function? onExpendIconClicked, onSingleDateClick;

  CustomHorizontalCalendar({super.key, this.onExpendIconClicked});

  @override
  State<CustomHorizontalCalendar> createState() =>
      _CustomHorizontalCalendarState();
}

class _CustomHorizontalCalendarState extends State<CustomHorizontalCalendar> {
  DateTime selectedDate = DateTime.now();

  List<DateTime> dateTimeList = [];

  @override
  Widget build(BuildContext context) {
    dateTimeList = selectedDate.getWeekDates();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.calendar_month),
                SizedBox(width: 8),
                Text(
                  '${DateFormat('MMM').format(selectedDate)}, ${selectedDate.year}',
                  style: const TextStyle(fontSize: Dimensions.titleFontSize),
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  widget.onExpendIconClicked?.call();
                });
              },
              icon: Icon(Icons.expand_more),
            ),
          ],
        ),

        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: Constants.listOfDays
                    .map((d) => Expanded(
                          child: Center(
                              child: Text(d,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                        ))
                    .toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: dateTimeList.map((dateTime) {
                  //asMap().entries.map((entry) {

                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        widget.onSingleDateClick
                            ?.call(dateTime.getWithoutTimeString());
                      },
                      child: CalendarDetail(
                        isSelected:
                            selectedDate.getDateDifference(dateTime) == 0,
                        day: '${dateTime.day}',
                        dotColor: Colors.transparent,
                        padding: Dimensions.paddingS,
                      ),
                    ),
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
