import 'package:comaapp/screen/main_screen.dart';
import 'package:comaapp/screen/mypage_screen.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedIndex = 0;

  // 네 개의 화면을 각각 다른 위젯으로 정의합니다.
  static const List<Widget> _pages = <Widget>[
    MainScreen(),
    Center(child: Text('동아리방', style: TextStyle(fontSize: 24))),
    Center(child: Text('코뮤니티', style: TextStyle(fontSize: 24))),
    MypageScreen(),
  ];

  // 네비게이션 아이템이 선택될 때 호출됩니다.
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // 선택된 페이지를 표시합니다.
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_bar_sharp),
            label: '동아리방',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.hub_sharp),
            label: '코뮤니티',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '내 정보',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFFF8C32),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }
}

