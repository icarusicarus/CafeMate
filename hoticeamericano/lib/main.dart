import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:kakao_flutter_sdk/auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'main.mapper.g.dart' show initializeJsonMapper;

import './Pages/LoginPage.dart';
import './Pages/GifticonPage.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  KakaoContext.clientId = dotenv.env['NATIVE_KEY'].toString();
  KakaoContext.javascriptClientId = dotenv.env['JS_KEY'].toString();

  initializeJsonMapper();

  runApp(new CafeMate());
}

class CafeMate extends StatefulWidget {
  @override
  _CafeMateState createState() => _CafeMateState();
}

class _CafeMateState extends State<CafeMate> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      routes: {
        '/gifticon': (context) => GifticonPage(),
      },
    );
  }
}
