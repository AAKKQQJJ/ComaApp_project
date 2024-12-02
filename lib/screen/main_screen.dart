import 'package:flutter/material.dart';

import '../kakao_login.dart';
import '../main_view_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final viewModel = MainViewModel(KakaoLogin());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("홈"),
          backgroundColor: Color(0xFFFF8C32),  //코마 메인 색상
          elevation: 0,
        ),
        body: Center(
          child: Column(
            children: [

            ],
          ),
        ));
  }
}
