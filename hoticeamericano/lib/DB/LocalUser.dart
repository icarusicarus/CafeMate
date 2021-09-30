import 'package:sqflite/sqflite.dart';

import './DBHelper.dart';
import './GifticonCount.dart';
import '../Models/LocalUser.dart';

Future<int?> insertUser(LocalUser user) async {
  final Database? _db = await DB.instance.database;

  final List<Map<String, dynamic>> _isUserDuplicated = await _db!.query(
    'user',
    columns: ['user_number', 'kind'],
    where: 'user_number = ? AND kind = ?',
    whereArgs: [user.userNumber, user.kind]
  );

  if(_isUserDuplicated.isEmpty) {
    LocalUser _user = LocalUser(
      userNumber: user.userNumber,
      kind: user.kind,
      name: user.name,
      email: user.email,
    );

    initGifticonCount(user.id!);

    return await _db.insert('user', _user.toMap(), conflictAlgorithm: ConflictAlgorithm.fail);
  }
  
  return null;  
}

// Future<int> userDelete() async {
//   final Database? _db = await DB.instance.database;
//   return await _db!.delete('user', where: 'id = 1');
// }