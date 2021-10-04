import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/auth.dart';
import 'package:kakao_flutter_sdk/user.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';

import '../Models/LocalUser.dart';
import '../Pages/ControllerPage.dart';
import '../Utils/API.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  _issueAccessToken(String authCode) async {
    try {
      var token = await AuthApi.instance.issueAccessToken(authCode);
      TokenManager.instance.setToken(token);
    } catch (e) {
      print(e.toString());
    }
  }

  _loginKakao() async {
    try {
      var code = await AuthCodeClient.instance.request();
      await _issueAccessToken(code);

      await _insertKakaoInfo();

      Navigator.push(context, MaterialPageRoute(builder: (context) => ControllerPage()));
    } on KakaoAuthException catch (e) {
      print(e.toString());
    } on KakaoClientException catch (e) {
      print(e.toString());
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _insertKakaoInfo() async {
    try {
      User _user = await UserApi.instance.me();

      LocalUser _localUser = LocalUser(
        userNumber: _user.id.toString(),
        kind: 0,
        name: _user.kakaoAccount?.profile?.nickname,
        email: _user.kakaoAccount?.email
      );

      await login(_localUser);
    } catch(e) {
      print(e);
    }
  }

  void _loginNaver() async {
    try {
      NaverLoginResult res = await FlutterNaverLogin.logIn();
      NaverAccessToken token = await FlutterNaverLogin.currentAccessToken;
      print(token.toString());

      await _insertNaverInfo(res);

      Navigator.push(context, MaterialPageRoute(builder: (context) => ControllerPage()));
    } catch (e) {
      print(e);
    }
  }

  Future<void> _insertNaverInfo(NaverLoginResult res) async {
    try {
      LocalUser _localUser = LocalUser(
        userNumber: res.account.id,
        kind: 1,
        name: res.account.nickname,
        email: res.account.email
      );
      await login(_localUser);
    } catch(e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff8D745B),
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/splash_logo.png',
                    width: 200.0,
                  ),
                  Text(
                    '취향의 카페를 찾아보세요.',
                    style: TextStyle(
                      color: Colors.white
                    )
                  )
                ],
              ),
            ),

            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 600,
                    height: 90,
                    child: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,  
                      icon: Image.asset('assets/images/naver_login2.png'),
                      onPressed: () => { _loginNaver() },
                    ),
                  ),
                  Container(
                    width: 600,
                    height: 90,
                    child: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,  
                      icon: Image.asset('assets/images/kakao_login2.png'),
                      onPressed: () => { _loginKakao() },
                    ),
                  ),
                  Container(
                    child: InkWell(
                      child: Text(
                        '계속하기',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          decoration: TextDecoration.underline
                        )
                      ),
                      onTap: (() async {
                        // await updateGifticon(6000);
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ControllerPage()));
                      }),
                    )
                  )
                ],
              )
            ),
          ]
        )
      )
    );
  }
}
