import 'package:flutter/material.dart';

import '../component/calendar.dart';
import '../component/schedule_bottom_sheet.dart';
import '../component/schedule_card.dart';
import '../component/today_banner.dart';
import '../const/color.dart';
import '../model/kakao_login.dart';
import '../viewModel/main_view_model.dart';
import '../model/schedule_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  DateTime selectedDay = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  Map<DateTime, List<ScheduleModel>> schedule = {
    DateTime.utc(2024, 11, 23): [
      ScheduleModel(
        id: 1,
        startTime: 12,
        endTime: 13,
        content: "플러터 공부하기",
        Date: DateTime.utc(2024, 11, 23),
        category: categoryColor[0],
        atCreate: DateTime.now().toUtc(),
      ),
      ScheduleModel(
        id: 2,
        startTime: 16,
        endTime: 18,
        content: "세미나 자료 준비",
        Date: DateTime.utc(2024, 11, 23),
        category: categoryColor[3],
        atCreate: DateTime.now().toUtc(),
      ),
      ScheduleModel(
        id: 3,
        startTime: 16,
        endTime: 18,
        content: "세미나 자료 준비_2",
        Date: DateTime.utc(2024, 11, 23),
        category: categoryColor[5],
        atCreate: DateTime.now().toUtc(),
      ),
      ScheduleModel(
        id: 4,
        startTime: 16,
        endTime: 18,
        content: "세미나 자료 준비_3",
        Date: DateTime.utc(2024, 11, 23),
        category: categoryColor[2],
        atCreate: DateTime.now().toUtc(),
      ),
      ScheduleModel(
        id: 5,
        startTime: 16,
        endTime: 18,
        content: "세미나 자료 준비_4",
        Date: DateTime.utc(2024, 11, 23),
        category: categoryColor[6],
        atCreate: DateTime.now().toUtc(),
      ),
      ScheduleModel(
        id: 6,
        startTime: 16,
        endTime: 18,
        content: "세미나 자료 준비_5",
        Date: DateTime.utc(2024, 11, 23),
        category: categoryColor[2],
        atCreate: DateTime.now().toUtc(),
      ),
      ScheduleModel(
        id: 7,
        startTime: 16,
        endTime: 18,
        content: "세미나 자료 준비_6",
        Date: DateTime.utc(2024, 11, 23),
        category: categoryColor[1],
        atCreate: DateTime.now().toUtc(),
      ),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("홈"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) {
              return ScheduleBottomSheet();
            },
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Calendar(
              focusedDay: DateTime(2024, 11, 1),
              onDaySelected: onDaySelected,
              selectedDayPredicate: selectedDayPredicate,
            ),
            TodayBanner(
              selectedDay: selectedDay,
              taskcount: 0,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                child: ListView.separated(
                  itemCount: schedule.containsKey(selectedDay)
                      ? schedule[selectedDay]!.length
                      : 0,
                  itemBuilder: (BuildContext context, int index) {
                    final selectedSchedules = schedule[selectedDay]!;
                    final scheduleModel = selectedSchedules[index];
        
                    return ScheduleCard(
                      startTime: scheduleModel.startTime,
                      endTime: scheduleModel.endTime,
                      content: scheduleModel.content,
                      colors: Color(int.parse(
                        'FF${scheduleModel.category}',
                        radix: 16,
                      )),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 8,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
}

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      this.selectedDay = selectedDay;
    });
  }

  bool selectedDayPredicate(DateTime date) {
    if (selectedDay == null) {
      return false;
    }
    return date.isAtSameMomentAs(selectedDay!);
  }
}

