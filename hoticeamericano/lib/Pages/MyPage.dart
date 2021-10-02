import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './MainPage.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(child: Icon(Icons.arrow_back_ios)),
                Expanded(
                    flex: 2,
                    child: Text(
                      '내 정보',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    )),
                Expanded(child: Icon(Icons.more_vert)),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 130.0,
                  height: 130.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new ExactAssetImage(
                              'assets/images/뜨아아로고_사각.png'))),
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  '박지혜',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 22.0, bottom: 22.0),
                    color: Color(0xff8D745B),
                    child: InkWell(
                      child: Text(
                        '보유쿠폰',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 22.0, bottom: 22.0),
                    color: Color(0xff8D745B),
                    child: InkWell(
                      child: Text(
                        '구매기록',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 22.0, bottom: 22.0),
                    color: Color(0xff8D745B),
                    child: InkWell(
                      child: Text(
                        '사용기록',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15.0, color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30.0, left: 50.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      '이름',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      '박지혜',
                      style: TextStyle(fontSize: 14.0, color: Colors.grey),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Text(
                      '생년월일',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      '2000년 06월 18일',
                      style: TextStyle(fontSize: 14.0, color: Colors.grey),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Text(
                      '성별',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      '여자',
                      style: TextStyle(fontSize: 14.0, color: Colors.grey),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Text(
                      '나이',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      '22세',
                      style: TextStyle(fontSize: 14.0, color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
