import 'package:flutter/material.dart';

import '../const/color.dart';

class TodayBanner extends StatelessWidget {
  final DateTime selectedDay;
  final int taskcount;

  const TodayBanner({
    required this.selectedDay,
    required this.taskcount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${selectedDay.year}년 ${selectedDay.month}월 ${selectedDay.day}일",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            ),
            Text(
              "${taskcount}개",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}
