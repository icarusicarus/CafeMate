import 'package:sqflite/sqflite.dart';

import './DBHelper.dart';
import '../Models/LocalUser.dart';

Future<void> upsertUser(LocalUser user) async {
  final Database? _db = await DB.instance.database;
  final List<Map<String, dynamic>> _maps = await _db!.query('user');

  if(_maps.isEmpty) {
    await _db.insert('user', user.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  else {
    await _db.update('user', user.toMap(), where: 'id = ?', whereArgs: [1], conflictAlgorithm: ConflictAlgorithm.replace);
  }
}

Future<LocalUser> getUser() async {
  final Database? _db = await DB.instance.database;
  final List<Map<String, dynamic>> _maps = await _db!.query('user');  

  LocalUser _localUser = LocalUser(
    name: _maps[0]['name'],
    email: _maps[0]['email']
  );

  return _localUser;
}

Future<String> getUserNumber() async {
  final Database? _db = await DB.instance.database;
  final List<Map<String, dynamic>> _maps = await _db!.query('user');

  try {
    return _maps[0]['user_number'];
  } catch(e) {
    return '';
  } 
}

Future<String> getUserEmail() async {
  final Database? _db = await DB.instance.database;
  final List<Map<String, dynamic>> _maps = await _db!.query('user');

  return _maps[0]['email'];
}

// Future<int> userDelete() async {
//   final Database? _db = await DB.instance.database;
//   return await _db!.delete('user', where: 'id = 1');
// }