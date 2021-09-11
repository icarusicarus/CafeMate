import 'dart:convert';

import 'package:http/http.dart' as http;

import '../DB/User.dart';
import '../Models/User.dart';

String url = "http://localhost:8080/";

Future<bool> register(User user) async {
  final _registerRequest = await http.post(
    Uri.parse(url + "register"),
    headers: { "Content-Type": "application/json" },
    body: json.encode({
      "user_id": user.userId,
      "password": user.password,
      "nickname": user.nickname,
      "sex": user.sex,
      "phone": user.phone
    })
  );
  Map<String, dynamic> _registerResponse = jsonDecode(_registerRequest.body);

  if(_registerRequest.statusCode == 200) {
    user.password = _registerResponse['hash'];
    await userInsert(user);
    return true;
  }

  return false;
}

Future<bool> login(User user) async {
  final _loginRequest = await http.post(
    Uri.parse(url + "login"),
    headers: { "Content-Type": "application/json" },
    body: json.encode({
      "user_id": user.userId,
      "password": user.password
    })
  );
  
  if(_loginRequest.statusCode == 200) {
    return true;
  }
  else {
    return false;
  }
}

void logout() async {
  await userDelete();
}