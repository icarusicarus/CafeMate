import 'dart:convert';

import 'package:http/http.dart' as http;

import '../DB/LocalUser.dart';
import '../DB/Gifticon.dart';
import '../Models/LocalUser.dart';
import '../Models/Gifticon.dart';

String url = "http://10.0.2.2:8080/";

Future<bool> login(LocalUser user) async {
  try {
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
      final Map<String, dynamic> json = _registerResponse;
      final Map<String, dynamic> data = json['data'];
      final String msg = json['msg'];
      
      Gifticon _gifticon;

      await upsertUser(user);

      if(msg == 'exist') {
        _gifticon = Gifticon(
          user_id: data['id'],
          g_4000: data['g_4000'],
          g_6000: data['g_6000'],
          g_8000: data['g_8000'],
          g_10000: data['g_10000'],
        );
      }

      else {
        _gifticon = Gifticon(
          user_id: data['id'],
          g_4000: 0,
          g_6000: 0,
          g_8000: 0,
          g_10000: 0,
        );
      }

      await initGifticon(_gifticon);

      return true;
    }
  } on http.ClientException catch(e) {
   print(e);
 } catch(e) {
   print(e);
 }

  return false;
}

Future<bool> updateGifticon(int price) async {
  final String _userNumber = await getUserNumber();
  final String _gifticonKind = "g_" + price.toString();
  final Gifticon _gifticonCount = await getGifticon();

  try {
    final _gifitconRequest = await http.post(
      Uri.parse(url + "gifticon/update"),
      headers: { "Content-Type": "application/json" },
      body: json.encode({
        "userNumber": _userNumber,
        "gifticonKind": _gifticonKind,
        "gifticonCount": _gifticonCount.toMap()

      })
    );
    // Map<String, dynamic> _gifitconResponse = jsonDecode(_gifitconRequest.body);

    if(_gifitconRequest.statusCode == 200) {
      await updateGifticonCount(price);
      return true;
    }
 } on http.ClientException catch(e) {
   print(e);
 } catch(e) {
   print(e);
 }

  return false;
}