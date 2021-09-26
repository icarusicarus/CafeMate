import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/auth.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';

import '../Models/LocalUser.dart';
import '../DB/LocalUser.dart';
import '../Utils/UserValidation.dart';
import '../Pages/MainPage.dart';
import '../Pages/Payment.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final List<TextEditingController> _controller = [
    TextEditingController(),
    TextEditingController()
  ];
  final _formKey = GlobalKey<FormState>();

  bool rememberCheck = false;

  issueAccessToken(String authCode) async {
    try {
      debugPrint("in issue acc tok");
      var token = await AuthApi.instance.issueAccessToken(authCode);
      print(token);
      debugPrint("redirect to main");
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainPage(),
          ));
    } catch (e) {
      print(e.toString());
    }
  }

  kakaoLogin() async {
    try {
      debugPrint("in kakaologin");
      var code = await AuthCodeClient.instance.request();
      debugPrint("code is");
      debugPrint(code);
      await issueAccessToken(code);
    } on KakaoAuthException catch (e) {
      print(e.toString());
    } on KakaoClientException catch (e) {
      print(e.toString());
    } catch (e) {
      print(e.toString());
    }
  }

  void kakaoLoginClicked() async {
    try {
      debugPrint('on it');
      await UserApi.instance.loginWithKakaoAccount();
      debugPrint('login');
      MaterialPageRoute(
        builder: (context) => MainPage(),
      );
    } catch (e) {
      debugPrint('Error in Kakao Login: $e');
    }
  }

  void naverLoginClicked() async {
    try {
      debugPrint('on it');
      await FlutterNaverLogin.logIn();
      debugPrint('login');
      MaterialPageRoute(
        builder: (context) => MainPage(),
      );
    } catch (e) {
      debugPrint('Error in Kakao Login: $e');
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
                          fontSize: 30.0),
                    )),
                Container(
                    margin: const EdgeInsets.only(top: 200.0),
                    child: Column(
                      children: <Widget>[
                        Container(padding: const EdgeInsets.only(bottom: 10.0)),
                        ElevatedButton(
                          child: Text('네이버로 로그인'),
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xff03c75a),
                              minimumSize: Size(double.infinity, 30),
                              padding: const EdgeInsets.all(15.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                          onPressed: () => {
                            debugPrint("on pressssss naver"),
                            naverLoginClicked()
                          },
                        ),
                        Container(padding: const EdgeInsets.only(bottom: 10.0)),
                        ElevatedButton(
                          child: Text(
                            '카카오계정 로그인',
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xfffee500),
                              minimumSize: Size(double.infinity, 30),
                              padding: const EdgeInsets.all(15.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                          onPressed: () => {
                            debugPrint("on pressssss kakao"),
                            kakaoLoginClicked()
                          },
                        ),
                      ),
                      validator: (_value) {
                        if(passwordValidation(_value)) {
                          return "한 개 이상의 대문자, 소문자, 숫자를 포함한 8자 이상 필요합니다.";
                        }
                      },
                      obscureText: true,
                    ),
                  ],
                )
              )
            ),
            Container(
              margin: const EdgeInsets.only(top: 50.0),
              child: Column(
                children: <Widget>[
                  ElevatedButton(
                    child: Text('로그인', style: TextStyle(color: Colors.black)),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffFFB902),
                      minimumSize: Size(double.infinity, 30),
                      padding: const EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)
                      )
                    ),
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Payment())
                      );
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 10.0)
                  ),
                  ElevatedButton(
                    child: Text('회원가입'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff271D0F),
                      minimumSize: Size(double.infinity, 30),
                      padding: const EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)
                      )
                    ),
                    onPressed: () async {
                      LocalUser _user = LocalUser(
                        userId: _controller[0].text,
                        password: _controller[1].text
                      );

                      print(await userInsert(_user));
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 10.0)
                  ),
                  ElevatedButton(
                    child: Text('카카오계정 로그인'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff271D0F),
                      minimumSize: Size(double.infinity, 30),
                      padding: const EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)
                      )
                    ),
                    onPressed: () => {kakaoLogin()},
                  ),

                  Container(
                    padding: const EdgeInsets.only(top: 30.0),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
                      }),
                    )
                  )
                ],
              )
            ),
          ],
        )
      )
    );
  }
}
