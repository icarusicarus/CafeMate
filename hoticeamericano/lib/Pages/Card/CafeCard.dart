import 'package:flutter/material.dart';

import '../../Utils/DesignValue.dart';
import '../Navigator/CafePage.dart';

Widget CafeCard(BuildContext context) {
  return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CafePage()));
      },
      child: Column(children: <Widget>[
        Container(
          width: cafeCardWidth,
          height: cafeCardHeight,
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
          width: cafeCardWidth,
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: const Radius.circular(10.0),
              bottomRight: const Radius.circular(10.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('의정서',
                  style: TextStyle(
                    fontSize: 10.0,
                  )),
              Text('선곡과 오롯한 시간이 필요하다면', style: TextStyle(fontSize: 11.0))
            ],
          )
        )
      ]
    )
  );
}
