import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:kakao_flutter_sdk/auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'main.mapper.g.dart' show initializeJsonMapper;

import './Pages/LoginPage.dart';
import './Pages/ControllerPage.dart';
import './Pages/GifticonPage.dart';
import '../DB/LocalUser.dart';

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


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder<String>(
        future: getUserNumber(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            if(snapshot.data!.isNotEmpty)
              return ControllerPage();
            else
              return LoginPage();
          }

          else {
            return Scaffold(
              backgroundColor: Color(0xff8D745B),
              body: Center(
                child: Text('로딩 중')
              )
            );
          }
        }
      ),
      routes: {
        '/gifticon': (context) => GifticonPage(),
      },
    );
  }
}
