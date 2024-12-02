import 'package:comaapp/model/social_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class MainViewModel {
  final SocialLogin _socialLogin;
  bool isLogined = false;
  User? user;

  MainViewModel(this._socialLogin);

  Future<bool> loginAndNavigate(BuildContext context) async {
    isLogined = await _socialLogin.login();
    if (isLogined) {
      user = await UserApi.instance.me();
      // 네비게이션 처리
      Navigator.pushNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("로그인에 실패했습니다"),
        ),
      );
    }
    return isLogined;
  }

  Future<void> logout() async {
    isLogined = await _socialLogin.logout();
    isLogined = false;
    user = null;
  }
}
