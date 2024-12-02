import 'package:comaapp/const/color.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class AnimatedDefaultTextStyleScreen extends StatefulWidget {
  @override
  _AnimatedDefaultTextStyleScreenState createState() =>
      _AnimatedDefaultTextStyleScreenState();
}

class _AnimatedDefaultTextStyleScreenState
    extends State<AnimatedDefaultTextStyleScreen> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 화면 중앙 정렬
          children: [
            Image.asset('images/yadon.jpg'), // 로고 또는 이미지
            SizedBox(height: 20),
            Center(
              child: Container(
                height: 120,
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 300),
                  style: TextStyle(
                    fontSize: 50.0,
                    color: selected ? Colors.blueAccent : Colors.orange, // primaryColor 대신 색상 설정
                    fontWeight: selected ? FontWeight.w100 : FontWeight.bold,
                  ),
                  child: Text('Coma'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
