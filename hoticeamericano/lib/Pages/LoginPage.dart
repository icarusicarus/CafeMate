import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/all.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final List<TextEditingController> _controller = [
    TextEditingController(),
    TextEditingController()
  ];
  bool rememberCheck = false;

  issueAccessToken(String authCode) async {
    try {
      var token = await AuthApi.instance.issueAccessToken(authCode);
      print(token);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ));
    } catch (e) {
      print(e.toString());
    }
  }

  kakaoLogin() async {
    try {
      var code = await AuthCodeClient.instance.request();
      await issueAccessToken(code);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '안녕하세요.\n반갑습니다.',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30.0),
                    )),
                Container(
                    margin: const EdgeInsets.only(top: 50.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: _controller[0],
                          decoration: InputDecoration(
                            hintText: '아이디',
                          ),
                          validator: (_value) {},
                        ),
                        TextFormField(
                          controller: _controller[1],
                          decoration: InputDecoration(
                            hintText: '비밀번호',
                          ),
                          validator: (_value) {},
                        ),
                      ],
                    )),
                Container(
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                        // title: Text('기억하기'),
                        // controlAffinity: ListTileControlAffinity.leading,
                        value: rememberCheck,
                        onChanged: (_) {
                          rememberCheck = !rememberCheck;
                          setState(() {});
                        },
                      ),
                      Text('기억하기')
                    ],
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 50.0),
                    child: Column(
                      children: <Widget>[
                        ElevatedButton(
                          child: Text('로그인'),
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 30),
                              padding: const EdgeInsets.all(15.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                          onPressed: () {},
                        ),
                        Container(padding: const EdgeInsets.only(bottom: 10.0)),
                        ElevatedButton(
                          child: Text('회원가입'),
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 30),
                              padding: const EdgeInsets.all(15.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                          onPressed: () {},
                        ),
                        Container(padding: const EdgeInsets.only(bottom: 10.0)),
                        ElevatedButton(
                          child: Text('카카오계정 로그인'),
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 30),
                              padding: const EdgeInsets.all(15.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                          onPressed: () => {kakaoLogin()},
                        ),
                      ],
                    )),
              ],
            )));
  }
}
