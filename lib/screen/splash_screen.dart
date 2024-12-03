import 'package:comaapp/const/color.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // 애니메이션 컨트롤러 초기화
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward(); // 애니메이션 시작

    // 위로 올라가는 애니메이션
    _animation = Tween<double>(begin: 0.0, end: -130.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut, // 부드러운 위로 올라가는 애니메이션
    ));

    // 3초 후 로그인 화면으로 이동
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // 애니메이션 컨트롤러 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          setState(() {
            // 탭 시 동작 추가 (필요에 따라)
          });
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, _animation.value), // 애니메이션 값에 따라 텍스트 위치 변경
                    child: child,
                  );
                },
                child: Text(
                  'Coma',
                  style: TextStyle(
                    fontSize: 80.0,
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NotoSans',
                      letterSpacing: -5,
                      shadows: [
                        Shadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: const Offset(3, 3),
                            blurRadius: 15),
                      ]
                  ),
                ),
              ),
              CircularProgressIndicator(
                color: primaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}