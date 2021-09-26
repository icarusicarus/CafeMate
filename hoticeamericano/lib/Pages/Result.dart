import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  bool getIsSuccessed(Map<String, String> result) {
    if (result['imp_success'] == 'true') {
      return true;
    }
    if (result['success'] == 'true') {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String>? result = ModalRoute.of(context)!.settings.arguments as Map<String, String>?;
    bool isSuccessed = getIsSuccessed(result!);

    return Scaffold(
      appBar: new AppBar(
        title: Text('아임포트 결과'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isSuccessed ? '성공' : '실패',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(50.0, 30.0, 50.0, 50.0),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text('아임포트 번호', style: TextStyle(color: Colors.grey))
                      ),
                      Expanded(
                        flex: 5,
                        child: Text(result['imp_uid'] ?? '-'),
                      ),
                    ],
                  ),
                ),
                isSuccessed ? Container(
                  padding: EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text('주문 번호', style: TextStyle(color: Colors.grey))
                      ),
                      Expanded(
                        flex: 5,
                        child: Text(result['merchant_uid'] ?? '-'),
                      ),
                    ],
                  ),
                ) : Container(
                  padding: EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text('에러 메시지', style: TextStyle(color: Colors.grey)),
                      ),
                      Expanded(
                        flex: 5,
                        child: Text(result['error_msg'] ?? '-'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}