import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../DB/Gifticon.dart';
import '../../Models/Gifticon.dart';
import '../../Utils/DesignValue.dart';

Widget MyCouponCard(int price)
{
  return Column(
    children: <Widget>[
      Container(
        width: gifticonCardWidth,
        height: gifticonCardHeight,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Color(0xff8D745B),
          ),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10.0),
            topRight: const Radius.circular(10.0),
          ),
          image: DecorationImage(
            image: AssetImage('assets/images/${price}.png'),
            fit: BoxFit.cover,
          ),
        )
      ),
      Container(
        width: gifticonCardWidth,
        height: gifticonCardBottomHeight,
        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 1,
            color: Color(0xff8D745B),
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: const Radius.circular(10.0),
            bottomRight: const Radius.circular(10.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                NumberFormat('###,###,###,###').format(price).replaceAll(' ', '') + '원',
                style: TextStyle(
                  fontWeight: FontWeight.w500
                )
              )
            ),

            FutureBuilder<Gifticon>(
              future: getGifticon(),
              builder: (context, snapshot) {
                if(snapshot.hasData) {
                  int? count = -1;

                  switch(price) {
                    case 4000:
                      count = snapshot.data!.g_4000;
                      break;
                    case 6000:
                      count = snapshot.data!.g_6000;
                      break;
                    case 8000:
                      count = snapshot.data!.g_8000;
                      break;
                    case 10000:
                      count = snapshot.data!.g_10000;
                      break;
                  }
                  return Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff8D745B),
                    ),
                    child: Text(
                      count.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xffffb902)
                      )
                    )
                  );
                }

                else {
                  return Text('');
                }
              },
            ),
          ]
        )
      )
    ]
  );
}