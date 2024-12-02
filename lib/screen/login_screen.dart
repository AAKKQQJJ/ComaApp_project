import 'package:comaapp/const/color.dart';
import 'package:comaapp/model/kakao_login.dart';
import 'package:comaapp/viewModel/main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:comaapp/main.dart';

final viewModel = MainViewModel(KakaoLogin());

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Image.asset('images/yadon.jpg'),
            SizedBox(height: 200),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFFE500),
              ),
              onPressed: () async {
                await viewModel.loginAndNavigate(context);
                setState(() {}); // 상태 업데이트
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'images/kakaologin.png',
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget getKakaoButton() {
//   return InkWell(
//     onTap: () async {
//       await viewModel.login();
//     },
//     child: Card(
//       margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
//       elevation: 2,
//       child: Container(
//         height: 50.0,
//         decoration: BoxDecoration(
//           color: Color(0xFFFFE500),
//           borderRadius: BorderRadius.circular(7.0),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Image.asset(
//               'images/kakaologin.png',
//               height: 30,
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
