import 'package:flutter/material.dart';

import '../const/color.dart';

class ScheduleCard extends StatelessWidget {
  final int startTime;
  final int endTime;
  final String content;
  final Color colors;

  const ScheduleCard({
    required this.startTime,
    required this.endTime,
    required this.content,
    required this.colors,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: primaryColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${startTime.toString().padLeft(2, '0')}:00",
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "${endTime.toString().padLeft(2,'0')}:00",
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: 10,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Text(content),
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colors,
                ),
                width: 16,
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
