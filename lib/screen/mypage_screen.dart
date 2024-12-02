import 'package:comaapp/const/color.dart';
import 'package:comaapp/screen/login_screen.dart';
import 'package:flutter/material.dart';

class MypageScreen extends StatefulWidget {
  const MypageScreen({super.key});

  @override
  State<MypageScreen> createState() => _MypageScreenState();
}

class _MypageScreenState extends State<MypageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("마이페이지"),
        centerTitle: false,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // 기본 패딩 추가
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 프로필 카드
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _profile(), // 프로필 이미지
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${viewModel.user?.kakaoAccount?.profile?.nickname ?? 'User'}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text("hi")
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 3,
              child: ListTile(
                leading: Icon(Icons.logout, color: Colors.red),
                title: Text(
                  "Logout",
                  style: TextStyle(fontSize: 16, color: Colors.red),
                ),
                onTap: () {
                  // 로그아웃 로직
                  viewModel.logout();
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
 }


Widget _profile() => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            // 테두리 추가
            color: Colors.black, // 테두리 색상
            width: 1.0, // 테두리 두께
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child:
              ///사용자 프로필 가지고오기
              Image.network(
                  viewModel.user?.kakaoAccount?.profile?.profileImageUrl ?? ''),
        ),
      ),
    );
