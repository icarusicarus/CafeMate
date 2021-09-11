import 'package:flutter/material.dart';

import '../Models/User.dart';
import '../Utils/API.dart';
import '../Utils/UserValidation.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final List<TextEditingController> _controller = [ TextEditingController(), TextEditingController() ];
  final _formKey = GlobalKey<FormState>();
  bool rememberCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff8D745B),
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
              margin: const EdgeInsets.only(top: 50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _controller[0],
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        hintText: ' 아이디',
                        hintStyle: TextStyle(color: Colors.white),
                        errorStyle: TextStyle(color: Colors.white),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                        ),
                        enabledBorder: UnderlineInputBorder(      
                          borderSide: BorderSide(color: Colors.white),   
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      validator: (_value) {
                        if(userIdVaildation(_value)) {
                          return "5자 이상의 알파벳, 숫자로 이루어져야 합니다";
                        }
                      },
                    ),
                    TextFormField(
                      controller: _controller[1],
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        hintText: ' 비밀번호',
                        hintStyle: TextStyle(color: Colors.white),
                        errorStyle: TextStyle(color: Colors.white),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                        ),
                        enabledBorder: UnderlineInputBorder(      
                          borderSide: BorderSide(color: Colors.white),   
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
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
                      if(_formKey.currentState!.validate()) {
                        User _user = User(
                          userId: _controller[0].text,
                          password: _controller[1].text
                        );
                        await login(_user);
                      }
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
                      // User _user = User(
                      //   userId: _controller[0].text,
                      //   password: _controller[1].text
                      // );

                      // print(await userInsert(_user));
                    },
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
                      onTap: (() {}),
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