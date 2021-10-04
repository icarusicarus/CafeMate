import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Models/Cafe.dart';
import '../../DB/Cafe.dart';
import '../Card/CafeInformation.dart';
import '../Card/MenuCard.dart';
import '../Card/CafeInformation.dart';
import '../Card/CardPadding.dart';
import '../Card/CafeMapInfo.dart';

class CafePage extends StatefulWidget {
  @override
  _CafePageState createState() => _CafePageState();
}

class _CafePageState extends State<CafePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   leading: IconButton(
        //     icon: Icon(Icons.arrow_back_ios),
        //     onPressed: () => {Navigator.pop(context)},
        //   ),
        // ),
        body: Container(
      height: double.infinity,
      decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          image: new DecorationImage(
              fit: BoxFit.fill,
              image: new ExactAssetImage('assets/images/11.png'))),
      child: new Container(
          margin: const EdgeInsets.only(
              top: 180.0, right: 0.0, left: 0.0, bottom: 0.0),
          padding: const EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(30.0),
              topRight: const Radius.circular(30.0),
            ),
          ),
          child: SingleChildScrollView(
              child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '카페 타이틀',
                  style: const TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    height: 1,
                    width: 150.0,
                    color: Color(0xff8D745B))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\n따뜻한 커피의 향을...\n느껴보세요...........................',
                  style: const TextStyle(fontSize: 13.0, color: Colors.white),
                ),
              ],
            ),
            Container(
                padding: const EdgeInsets.only(top: 30.0),
                child: Column(children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('메뉴',
                          style:
                              TextStyle(fontSize: 16.0, color: Colors.white)),
                    ],
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(
                              height: 150.0,
                              child: ListView(
                                physics: ClampingScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  MenuCard(context),
                                  CardPadding(),
                                  MenuCard(context),
                                  CardPadding(),
                                  MenuCard(context),
                                ],
                              ))
                        ],
                      ))
                ])),
            Container(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('지도',
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.white)),
                      ],
                    ),
                    // CafeMap()
                    // CafeInformation()
                    CafeMapInfo()
                  ],
                )),
          ]))),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Color(0xff271D0F),
      //   elevation: 0.0,
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       // icon: Image.asset('assets/images/test.png', width: 24.0),
      //       icon: Icon(
      //         Icons.home,
      //         color: Colors.white,
      //       ),
      //       label: '내쿠폰',
      //     ),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.home, color: Colors.white, size: 24.0),
      //         label: '홈'),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.home,
      //           color: Colors.white,
      //         ),
      //         label: '내정보'),
      //   ],
      //   selectedLabelStyle: TextStyle(fontSize: 10.0),
      //   unselectedLabelStyle: TextStyle(fontSize: 10.0),
      //   selectedItemColor: Colors.white,
      //   unselectedItemColor: Colors.white,
      // ),
    ));
  }
}
