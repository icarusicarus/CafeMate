import 'package:sqflite/sqflite.dart';

import './DBHelper.dart';
import '../Models/User.dart';

Future<int> userInsert(User user) async {
  final Database? _db = await DB.instance.database;

  User _user = User(
    id: 1,
    userId: user.userId,
    password: user.password
  );

  return await _db!.insert('user', _user.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
}

Future<int> userDelete() async {
  final Database? _db = await DB.instance.database;
  return await _db!.delete('user', where: 'id = 1');
}