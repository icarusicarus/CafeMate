import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/auth.dart';
import 'package:kakao_flutter_sdk/user.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';

import '../Pages/Payment.dart';

class Gifticon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, String>? result = ModalRoute.of(context)!.settings.arguments as Map<String, String>?;
    print('RESULT: ' + result.toString());

    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          ElevatedButton(
            child: Text('4000'),
            onPressed: (() async {
              if(await _checkUser()) {
                Map<String, String>? result = await Navigator.push(context, MaterialPageRoute(builder: (context) => Payment()));
                if(result == null || result['imp_success'] == 'false') {
                  print('결제 실패');
                }
                else {
                  
                }
              }
            })
          ),
          ElevatedButton(
            child: Text('6000'),
            onPressed: (() {})
          ),
          ElevatedButton(
            child: Text('8000'),
            onPressed: (() {})
          ),
          ElevatedButton(
            child: Text('10000'),
            onPressed: (() {})
          ),
        ],
      )
    );
  }

  Future<bool> _checkUser() async {
    OAuthToken token = await TokenManager.instance.getToken();
    print(token.toString());
    
    var naverToken = await FlutterNaverLogin.currentAccessToken;
    print(naverToken.toString());
    await FlutterNaverLogin.logOut();
    naverToken = await FlutterNaverLogin.currentAccessToken;
    print(naverToken.toString());
    
    // try {
    //   var code = await UserApi.instance.logout();
    //   print(code.toString());
    // } catch(e) {
    //   print(e.toString());
    // }

    if(token.refreshToken == null) {
      return false;
    }
    else {
      return true;
    }
  }
}