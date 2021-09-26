import 'package:flutter/material.dart';
import 'package:iamport_flutter/iamport_payment.dart';
import 'package:iamport_flutter/model/payment_data.dart';

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IamportPayment(
      initialChild: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                child: Text('잠시만 기다려주세요', style: TextStyle(fontSize: 20.0))
              )
            ],
          )
        )
      ),
      userCode: 'imp05206607',
      data: PaymentData(
        pg: 'kakaopay',
        payMethod : 'card',
        merchantUid: 'mid_${DateTime.now().millisecondsSinceEpoch}',
        name: '주문명:결제테스트',
        amount: 1,
        buyerEmail: 'iamport@siot.do',
        buyerName: '구매자이름',
        buyerTel: '010-1234-5678',
        buyerAddr: '서울특별시 강남구 삼성동',
        buyerPostcode: '123-456',
        appScheme: 'example'
      ),
      callback: (Map<String, String> result) {
        Navigator.pushReplacementNamed(
          context,
          '/result',
          arguments: result
        );
      },
    );
  }
}