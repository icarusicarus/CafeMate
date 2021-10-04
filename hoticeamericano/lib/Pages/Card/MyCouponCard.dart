import 'package:flutter/material.dart';

import '../../Utils/DesignValue.dart';

Widget MyCouponCard(String price)
{
  return Column(
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
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.white,
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
                price + '원',
                style: TextStyle(
                  fontWeight: FontWeight.w500
                )
              )
            ),
            Container(
              // alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff8D745B),
              ),
              child: Text(
                '3',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0xffffb902)
                )
              )
            )
          ]
        )
      )
    ]
  );
}