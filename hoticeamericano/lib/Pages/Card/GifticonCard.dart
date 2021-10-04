import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Navigator/Payment.dart';
import '../../DB/LocalUser.dart';
import '../../Utils/API.dart';
import '../../Utils/DesignValue.dart';

Widget GifticonCard(BuildContext context, int price) {
  final TextEditingController _controller = TextEditingController();

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
              image: AssetImage('assets/images/${price}.png'),
              fit: BoxFit.cover,
            ),
          )
        ),
        Container(
          width: gifticonCardWidth,
          height: gifticonCardBottomHeight,
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
      AlertDialog _alertDialog = AlertDialog(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TextButton(
              child: Text(
                '구입하기',
                style: TextStyle(color: Colors.black, fontSize: 15.0)
              ),
              onPressed: (() async {
                Navigator.pop(context);

                Map<String, String>? result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Payment(price: price))
                );

                if(result?['imp_success'] == 'true') {
                  await updateGifticon(price);
                }
              }),
            ),
            TextButton(
              child: Text(
                '선물하기',
                style: TextStyle(color: Colors.black, fontSize: 15.0)
              ),
              onPressed: (() {
                Navigator.pop(context);

                AlertDialog _alertDialog = AlertDialog(
                  title: Text(
                    '선물할 친구의 이메일을 적어주세요.',
                    style: TextStyle(fontSize: 15.0)
                  ),
                  content: Container(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff8D745B)),
                        ),
                      )
                    )
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text(
                        '확인',
                        style: TextStyle(color: Colors.black, fontSize: 15.0)
                      ),
                      onPressed: (() async {
                        Navigator.pop(context);

                        String _email = _controller.text;
                        if(await isEmailExisted(_email)) {
                            Map<String, String>? result = await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Payment(price: price))
                          );

                          if(result?['imp_success'] == 'true') {
                            await updateGifticon(price, email: _email);
                          }
                        }

                        else {
                          print('이메일 없..');
                        }
                      }),
                    ),
                  ],
                );
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return _alertDialog;
                  }
                );
              }),
            ),
          ],
        )
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return _alertDialog;
        }
      );
    })
  );
}