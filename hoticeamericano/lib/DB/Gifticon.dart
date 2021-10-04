import 'package:sqflite/sqflite.dart';

import './DBHelper.dart';
import '../Models/Gifticon.dart';

Future<Gifticon> getGifticon() async {
  final Database? _db = await DB.instance.database;
  final List<Map<String, dynamic>> _maps = await _db!.query('gifticon');

  Gifticon _gifticon = Gifticon(
    g_4000: _maps[0]['g_4000'],
    g_6000: _maps[0]['g_6000'],
    g_8000: _maps[0]['g_8000'],
    g_10000: _maps[0]['g_10000'],
  );

  return _gifticon;
}

Future<void> initGifticon(Gifticon gifticon) async {
  final Database? _db = await DB.instance.database;
  await _db!.update('gifticon', gifticon.toMap(), where: 'id = ?', whereArgs: [1], conflictAlgorithm: ConflictAlgorithm.replace);
}

Future<void> updateGifticonCount(int price) async {
  final Database? _db = await DB.instance.database;
  final List<Map<String, dynamic>> _maps = await _db!.query('gifticon');

  Gifticon _gifticon = Gifticon();

  switch(price) {
    case 4000:
      _gifticon.g_4000 = _maps[0]['g_4000'] + 1;
      await _db.update('gifticon', _gifticon.toMap(), where: 'id = ?', whereArgs: [1], conflictAlgorithm: ConflictAlgorithm.replace);
      break;
    case 6000:
      _gifticon.g_6000 = _maps[0]['g_6000'] + 1;
      await _db.update('gifticon', _gifticon.toMap(), where: 'id = ?', whereArgs: [1], conflictAlgorithm: ConflictAlgorithm.replace);
      break;
    case 8000:
      _gifticon.g_8000 = _maps[0]['g_8000'] + 1;
      await _db.update('gifticon', _gifticon.toMap(), where: 'id = ?', whereArgs: [1], conflictAlgorithm: ConflictAlgorithm.replace);
      break;
    case 10000:
      _gifticon.g_10000 = _maps[0]['g_10000'] + 1;
      await _db.update('gifticon', _gifticon.toMap(), where: 'id = ?', whereArgs: [1], conflictAlgorithm: ConflictAlgorithm.replace);
      break;
  }
}