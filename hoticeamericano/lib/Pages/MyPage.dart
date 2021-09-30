import 'package:flutter/material.dart';

import './MainPage.dart';

Column _buildButtonColumn(String label) {
  debugPrint(label);
  return Column(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
          color: Color(0xff8D745B),
          margin: const EdgeInsets.only(top: 50.0, left: 3.0, right: 3.0),
          child:
              Text(label, style: TextStyle(fontSize: 12, color: Colors.white))),
    ],
  );
}

Widget titleSection = Container(
    child: new Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    new Container(
      width: 50.0,
      height: 50.0,
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
              fit: BoxFit.fill,
              image: new ExactAssetImage('assets/images/뜨아아로고_사각.png'))),
    ),
    new Text('어쩌구 님')
  ],
));

Widget buttonSection = Container(
    child: Row(
  children: [
    _buildButtonColumn('보유쿠폰'),
    _buildButtonColumn('구매기록'),
    _buildButtonColumn('사용기록')
  ],
));
Widget detailSection = Container(child: Text('이름: 저쩌구'));

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [titleSection, buttonSection, detailSection],
      )
    );
  }
}
