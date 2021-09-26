import 'package:flutter/material.dart';

import '../Models/Cafe.dart';
import '../DB/Cafe.dart';
import './Section/CafeInformation.dart';
import './Section/CafeCard.dart';
import './Section/CafeCardPadding.dart';
import '../Pages/MainPage.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('내 정보',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          color: Colors.black,
          tooltip: '뒤로가기',
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MainPage()));
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_vert),
            color: Colors.black,
            tooltip: 'Show more',
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [titleSection, buttonSection, detailSection],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff271D0F),
        elevation: 0.0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            // icon: Image.asset('assets/images/test.png', width: 24.0),
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: '내쿠폰',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white, size: 24.0),
              label: '홈'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: '내정보'),
        ],
        selectedLabelStyle: TextStyle(fontSize: 10.0),
        unselectedLabelStyle: TextStyle(fontSize: 10.0),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
      ),
    );
  }
}
