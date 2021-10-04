import 'package:flutter/material.dart';

import '../Card/MyCouponCard.dart';
import '../Card/CardPadding.dart';

class MyCouponPage extends StatefulWidget {
  @override
  _MyCouponPageState createState() => _MyCouponPageState();
}

class _MyCouponPageState extends State<MyCouponPage>  {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 20.0, right: 30.0, left: 30.0, bottom: 20.0),
        color: Color(0xffE4E4E4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                MyCouponCard('4,000'),
                CardPadding(),
                MyCouponCard('6,000'),
              ],
            ),

            Container(margin: const EdgeInsets.only(top: 5.0, bottom: 5.0)),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                MyCouponCard('8,000'),
                CardPadding(),
                MyCouponCard('10,000'),
              ],
            )
          ],
        ),
      )
    );
  }
}