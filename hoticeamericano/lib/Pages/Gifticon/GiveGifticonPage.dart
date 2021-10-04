import 'package:flutter/material.dart';

import '../Card/GifticonCard.dart';
import '../Card/CardPadding.dart';

class GiveGifticonPage extends StatefulWidget {
  @override
  _GiveGifticonPageState createState() => _GiveGifticonPageState();
}

class _GiveGifticonPageState extends State<GiveGifticonPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 20.0, right: 30.0, left: 30.0, bottom: 35.0),
        color: Color(0xffE4E4E4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GifticonCard(context, 4000),
                CardPadding(),
                GifticonCard(context, 6000),
              ],
            ),

            Container(margin: const EdgeInsets.only(top: 5.0, bottom: 5.0)),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GifticonCard(context, 8000),
                CardPadding(),
                GifticonCard(context, 10000),
              ],
            )
          ],
        ),
      )
    );
  }
}