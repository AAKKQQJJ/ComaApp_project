import 'package:comaapp/screen/login_screen.dart';
import 'package:comaapp/screen/main_screen.dart';
import 'package:comaapp/screen/mypage_screen.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

void main() {
  KakaoSdk.init(nativeAppKey: 'a0c2cfd55b6778e5f5942ea5fc3ff7ed');
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/main' : (context) => MainScreen(),
        '/mypage' : (context) => MypageScreen(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hi"),
        ),
      ),
    );
  }
}
