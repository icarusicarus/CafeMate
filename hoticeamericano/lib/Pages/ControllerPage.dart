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
          padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
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
                      icon: Image.asset('assets/images/present.png', width: 22.0,),
                      onPressed: (() {}),
                    ),
                  ),
                ]
              )
            ],
          )
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.only(top: 10.0),
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color(_index == 1 ? 0xff8D745B : 0xffffffff),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20.0),
            topRight: const Radius.circular(20.0),
          ),
        ),
        child: showPage(_index)
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff271D0F),
        elevation: 0.0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _index == 0 ? Image.asset('assets/images/coupon_on.png', width: 24.0) : Image.asset('assets/images/coupon_off.png', width: 24.0),
            label: '내쿠폰',
          ),
          BottomNavigationBarItem(
            icon: _index == 1 ? Image.asset('assets/images/home_on.png', width: 20.0) : Image.asset('assets/images/home_off.png', width: 20.0),
            label: '홈'
          ),
          BottomNavigationBarItem(
            icon: _index == 2 ? Image.asset('assets/images/info_on.png', width: 22.0) : Image.asset('assets/images/info_off.png', width: 22.0),
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