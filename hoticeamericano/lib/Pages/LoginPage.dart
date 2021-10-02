import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/auth.dart';
import 'package:kakao_flutter_sdk/user.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';

import '../Models/LocalUser.dart';
import '../DB/LocalUser.dart';
import '../Pages/ControllerPage.dart';

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

      _insertKakaoInfo();

      Navigator.push(context, MaterialPageRoute(builder: (context) => ControllerPage()));
    } on KakaoAuthException catch (e) {
      print(e.toString());
    } on KakaoClientException catch (e) {
      print(e.toString());
    } catch (e) {
      print(e.toString());
    }
  }

  void _insertKakaoInfo() async {
    try {
      User _user = await UserApi.instance.me();

      LocalUser _localUser = LocalUser(
        userNumber: _user.id.toString(),
        kind: 0,
        name: _user.kakaoAccount?.profile?.nickname,
        email: _user.kakaoAccount?.email
      );
      await insertUser(_localUser);
    } catch(e) {
      debugPrint('$e');
    }
  }

  void _loginNaver() async {
    try {
      NaverLoginResult res = await FlutterNaverLogin.logIn();
      NaverAccessToken token = await FlutterNaverLogin.currentAccessToken;
      print(token.toString());

      _insertNaverInfo(res);

      Navigator.push(context, MaterialPageRoute(builder: (context) => ControllerPage()));
    } catch (e) {
      print(e);
    }
  }

  void _insertNaverInfo(NaverLoginResult res) async {
    try {
      LocalUser _localUser = LocalUser(
        userNumber: res.account.id,
        kind: 1,
        name: res.account.nickname,
        email: res.account.email
      );
      await insertUser(_localUser);
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
        padding: const EdgeInsets.only(right: 30.0, left: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                '안녕하세요.\n반갑습니다.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30.0
                ),
              )
            ),
            Container(
              margin: const EdgeInsets.only(top: 200.0),
              child: Column(
                children: <Widget>[
                  Container(
                    width: 600,
                    height: 90,
                    child: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,  
                      icon: Image.asset('assets/images/naver_login.png'),
                      onPressed: () => { _loginNaver() },
                    ),
                  ),
                  Container(
                    width: 600,
                    height: 90,
                    child: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,  
                      icon: Image.asset('assets/images/kakao_login.png'),
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
                      onTap: (() {
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
