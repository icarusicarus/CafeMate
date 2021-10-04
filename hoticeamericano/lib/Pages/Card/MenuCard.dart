import 'package:flutter/material.dart';

import '../../Utils/DesignValue.dart';
import '../Navigator/CafePage.dart';

Widget MenuCard(BuildContext context) {
  return Column(children: <Widget>[
    Container(
        width: 120,
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10.0),
            topRight: const Radius.circular(10.0),
          ),
          image: DecorationImage(
            image: AssetImage('assets/images/1.png'),
            fit: BoxFit.cover,
          ),
        )),
    Container(
        width: 120,
        height: 30,
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: const Radius.circular(10.0),
            bottomRight: const Radius.circular(10.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            Text('아이스 아메리카노',
                style: TextStyle(
                  fontSize: 10.0,
                )),
            Text('4000원',
                style: TextStyle(
                  fontSize: 3.0,
                ))
          ],
        ))
  ]);
}
