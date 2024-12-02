import 'package:flutter/cupertino.dart';

class ScheduleModel {
  ///1.id
  final int id;

  ///2.시작 시간
  final int startTime;

  ///3.종료 시간
  final int endTime;

  ///4.일정 내용
  final String content;

  ///5.날짜
  final DateTime Date;

  ///6.카테고리
  final String category;

  ///7.생성 시간
  final DateTime atCreate;

  ScheduleModel({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.content,
    required this.Date,
    required this.category,
    required this.atCreate,
  });
}
