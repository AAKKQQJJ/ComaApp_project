import 'package:comaapp/screen/homescreen.dart';
import 'package:comaapp/screen/login_screen.dart';
import 'package:comaapp/screen/main_screen.dart';
import 'package:comaapp/screen/mypage_screen.dart';
import 'package:comaapp/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  KakaoSdk.init(nativeAppKey: 'a0c2cfd55b6778e5f5942ea5fc3ff7ed');
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds: 3));
  FlutterNativeSplash.remove();
  await initializeDateFormatting();
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/login': (context) => LoginScreen(),
        '/main': (context) => MainScreen(),
        '/mypage': (context) => MypageScreen(),
        '/home': (context) => Homescreen(),
        '/splash' : (context) => SplashScreen(),
      },
    );
  }
}


