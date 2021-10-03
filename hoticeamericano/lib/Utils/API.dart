import 'dart:convert';

import 'package:http/http.dart' as http;

import '../DB/LocalUser.dart';
import '../DB/Gifticon.dart';
import '../Models/LocalUser.dart';
import '../Models/Gifticon.dart';

String url = "http://10.0.2.2:8080/";

Future<bool> login(LocalUser user) async {
  final _registerRequest = await http.post(
    Uri.parse(url + "login"),
    headers: { "Content-Type": "application/json" },
    body: json.encode({
      "userNumber": user.userNumber,
      "kind": user.kind,
      "name": user.name,
      "email": user.email
    })
  );
  Map<String, dynamic> _registerResponse = jsonDecode(_registerRequest.body);

  if(_registerRequest.statusCode == 200) {
    Map<String, dynamic> data = _registerResponse['data'];
    Gifticon? _gifticon;

    await upsertUser(user);

    if(data.isNotEmpty) {
      _gifticon = Gifticon(
        g_4000: data['g_4000'],
        g_6000: data['g_6000'],
        g_8000: data['g_8000'],
        g_10000: data['g_10000'],
      );

      await upsertGifticon(_gifticon);
    }

    else {
      await upsertGifticon(_gifticon);
    }
    
    return true;
  }

  return false;
}

// Future<bool> updateGifticon(int price) async {
//   final String _userNumber = await getUserNumber();
//   final String _gifticon = "g_" + price.toString();

//   final _gifitconRequest = await http.post(
//     Uri.parse(url + "gifitcon")
//   );
// }