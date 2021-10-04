import 'package:flutter/material.dart';

Widget MenuCard() {
  return Column(children: <Widget>[
    Container(
      width: 130,
      height: 100,
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
      width: 130,
      height: 45,
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
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              '아이스 아메리카노',
              style: TextStyle(fontSize: 12.0)
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              '4000원',
              style: TextStyle(fontSize: 10.0)
            )
          )
        ],
      )
    )
    ]
  );
}
