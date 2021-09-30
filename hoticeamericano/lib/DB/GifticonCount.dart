import 'package:sqflite/sqflite.dart';

import './DBHelper.dart';
import '../Models/GifticonCount.dart';

Future<void> initGifticonCount(int userId) async {
  final Database? _db = await DB.instance.database;
  GifticonCount _gifticonCount = GifticonCount(
    userId: userId,
    gifticon_4000: 0,
    gifticon_6000: 0,
    gifticon_8000: 0,
    gifticon_10000: 0
  );

  await _db?.insert('gifticon_count', _gifticonCount.toMap(), conflictAlgorithm: ConflictAlgorithm.fail);
}

// Future<int> updateGifticonCount(int gifticon) async {
//   final Database? _db = await DB.instance.database;
//   final List<Map<String, dynamic>> _maps = await _db!.query(
//     'cafe',
//     where: 'user_id = ?',
//     whereArgs: [gifticon]
//   );

//   return await _db.update('gifticon_count', );
}