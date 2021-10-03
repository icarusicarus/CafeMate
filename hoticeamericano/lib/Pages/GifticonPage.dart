import 'package:flutter/material.dart';

import './Gifticon/GiveGifticonPage.dart';
import './Gifticon/MyCoupon.dart';

class GifticonPage extends StatefulWidget {
  @override
  _GifticonPageState createState() => _GifticonPageState();
}

class _GifticonPageState extends State<GifticonPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String>? result = ModalRoute.of(context)!.settings.arguments as Map<String, String>?;
    print('RESULT: ' + result.toString());

    // if(result!['imp_success'] == 'true') {

    // }

    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(right: 25.0, left: 25.0),
          margin: const EdgeInsets.only(top: 10.0),
          color: Colors.white,
          child: TabBar(
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 3.0,
                color: Color(0xffffb902)
              ),
              insets: EdgeInsets.symmetric(horizontal: 50.0)
            ),
            labelColor: Colors.black,
            labelStyle: TextStyle(fontSize: 15),
            unselectedLabelStyle: TextStyle(fontSize: 15),
            controller: _tabController,
            tabs: <Tab>[
              Tab(text: '선물하기'),
              Tab(text: '내쿠폰'),
            ]),
        ),

        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              GiveGifticonPage(),
              MyCouponPage(),
            ],
          ),
        )
      ],
    );
  }
}