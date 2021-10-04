import 'package:flutter/material.dart';

import '../DB/LocalUser.dart';
import '../Models/LocalUser.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LocalUser>(
      future: getUser(),
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          String name = snapshot.data!.name!;
          String email = snapshot.data!.email!;

          return Container(
            margin: const EdgeInsets.only(top: 10.0),
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Text(
                            '내정보',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold
                              ),
                          )
                        ),
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
                              image: new ExactAssetImage('assets/images/뜨아아로고_사각.png')
                            )
                          ),
                        ),
                        SizedBox(height: 18),
                        Text(
                          name,
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
                            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
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
                            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
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
                            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
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
                            Text('이름', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                            SizedBox(width: 20.0,),
                            Text(name, style: TextStyle(fontSize: 14.0, color: Colors.grey)),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          children: [
                            Text('이메일', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                            SizedBox(width: 20.0,),
                            Text(email, style: TextStyle(fontSize: 14.0, color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )
            ),
          );
        }

        else {
          return Text('로딩중');
        }
      }
    );
  }
}
