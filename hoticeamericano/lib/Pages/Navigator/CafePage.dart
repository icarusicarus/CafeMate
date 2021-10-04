import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Card/CafeMapInfo.dart';
import '../Card/MenuCard.dart';
import '../Card/CardPadding.dart';

class CafePage extends StatefulWidget {
  @override
  _CafePageState createState() => _CafePageState();
}

class _CafePageState extends State<CafePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Stack(
      children: <Widget>[
        Container(
          height: 300.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: new ExactAssetImage('assets/images/1.png'))),
        ),
        Container(
            width: double.infinity,
            height: double.infinity,
            // alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(top: 30.0, left: 40.0, right: 40.0),
            margin: const EdgeInsets.only(top: 250.0),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(30.0),
                topRight: const Radius.circular(30.0),
              ),
            ),
            child: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text('부산커피',
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
                Divider(
                  color: Color(0xff8D745B),
                  thickness: 1,
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Text('more than coffee_\n커피 그 이상의 공간',
                        style: TextStyle(color: Colors.white))),
                Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Text('메뉴',
                                style: TextStyle(color: Colors.white))),
                        Container(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                                height: 150.0,
                                child: ListView(
                                    physics: ClampingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    children: <Widget>[
                                      MenuCard(),
                                      CardPadding(),
                                      MenuCard(),
                                      CardPadding(),
                                      MenuCard(),
                                    ]))
                          ],
                        )),
                      ],
                    )),
                Container(
                    margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Text('지도',
                                style: TextStyle(color: Colors.white))),
                        CafeMapInfo()
                      ],
                    ))
              ],
            )))
      ],
    )));
  }
}
