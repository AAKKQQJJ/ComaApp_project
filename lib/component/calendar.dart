import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../const/color.dart';

class Calendar extends StatelessWidget {
  final DateTime focusedDay;
  final OnDaySelected onDaySelected;
  final bool Function(DateTime date) selectedDayPredicate;

  const Calendar({
    required this.focusedDay,
    required this.onDaySelected,
    required this.selectedDayPredicate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final defaultBoxDecoration = BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        border: Border.all(
          color: Colors.grey[200]!,
          width: 1.0,
        ));

    final defaultTextStyle = TextStyle(
      fontWeight: FontWeight.w700,
      color: Colors.grey[600],
    );

    return TableCalendar(
        locale: 'ko_KR',
        focusedDay: DateTime(2024, 11, 1),
        firstDay: DateTime(1900),
        lastDay: DateTime(3000),
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle:
              TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
        ),
        calendarStyle: CalendarStyle(
          isTodayHighlighted: true,
          defaultDecoration: defaultBoxDecoration,
          weekendDecoration: defaultBoxDecoration,
          selectedDecoration: defaultBoxDecoration.copyWith(
            border: Border.all(
              color: primaryColor,
              width: 1.0,
            ),
          ),
          outsideDecoration: defaultBoxDecoration.copyWith(
            border: Border.all(color: Colors.transparent),
          ),
          todayDecoration: defaultBoxDecoration.copyWith(
            color: primaryColor,
          ),
          defaultTextStyle: defaultTextStyle,
          weekendTextStyle: defaultTextStyle,
          selectedTextStyle: defaultTextStyle.copyWith(
            color: primaryColor,
          ),
        ),
        onDaySelected: onDaySelected,
        selectedDayPredicate: selectedDayPredicate,
    );
  }
}
