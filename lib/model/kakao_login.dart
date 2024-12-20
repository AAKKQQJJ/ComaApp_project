import 'package:comaapp/model/social_login.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class KakaoLogin implements SocialLogin{
  @override
  Future<bool> login() async{
    try {
      bool isInstalled = await isKakaoTalkInstalled();
      if(isInstalled){
        try {
          await UserApi.instance.loginWithKakaoTalk();
          return true;
        }catch(e){
          return false;
        }
      } else{
        try {
          await UserApi.instance.loginWithKakaoAccount();
          return true;
        } catch(e){
          return false;
        }
      }
    }catch(error){
      return false;
    }
  }
  @override
  Future<bool> logout() async{
    try{
      await UserApi.instance.logout();
      return true;
    }catch(error){
      return false;
    }
  }

}

