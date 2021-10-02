import 'package:flutter/material.dart';

import '../Utils/ShowPage.dart';

class ControllerPage extends StatefulWidget {
  @override
  _ControllerPageState createState() => _ControllerPageState();
}

class _ControllerPageState extends State<ControllerPage> {
  int _index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: Container(
          padding: const EdgeInsets.only(top: 30.0, left: 15.0, right: 15.0),
          child: AppBar(
            backgroundColor: Colors.black,
            centerTitle: false,
            title: Text(
              'CAFÉMATE',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold
              )
            ),
            actions: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: IconButton(
                      icon: Icon(Icons.wallet_giftcard),
                      onPressed: (() {}),
                    ),
                  ),
                  Text('선물함')
                ]
              )
            ],
          )
        ),
      ),
      body: showPage(_index),
      
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff271D0F),
        elevation: 0.0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            // icon: Image.asset('assets/images/test.png', width: 24.0),
            icon: Icon(Icons.home, color: Colors.white,),
            label: '내쿠폰',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white, size: 24.0),
            label: '홈'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white,),
            label: '내정보'
          ),
        ],
        selectedLabelStyle: TextStyle(fontSize: 10.0),
        unselectedLabelStyle: TextStyle(fontSize: 10.0),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        onTap: (int _index) {
          setState(() { this._index = _index; });
        },
      ),
    );   
  }
}