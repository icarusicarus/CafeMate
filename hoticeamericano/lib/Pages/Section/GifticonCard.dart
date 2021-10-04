import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Payment.dart';
import '../../Utils/API.dart';
import '../../Utils/DesignValue.dart';

Widget GifticonCard(BuildContext context, int price) {
  return InkWell(
    child: Column(
      children: <Widget>[
        Container(
          width: gifticonCardWidth,
          height: gifticonCardHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(10.0),
              topRight: const Radius.circular(10.0),
            ),
            image: DecorationImage(
              image: AssetImage('assets/images/1.png'),
              fit: BoxFit.cover,
            ),
          )
        ),
        Container(
          width: gifticonCardWidth,
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Color(0xff8D745B),
            borderRadius: BorderRadius.only(
              bottomLeft: const Radius.circular(10.0),
              bottomRight: const Radius.circular(10.0),
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              NumberFormat('###,###,###,###').format(price).replaceAll(' ', '') + '원',
              style: TextStyle(color: Colors.white)
            )
          )
        )
      ],
    ),
    onTap: (() async {
      Map<String, String>? result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Payment(price: 4000))
      );

      if(result?['imp_success'] == 'true') {
        await updateGifticon(price);
      }
    })
  );
}