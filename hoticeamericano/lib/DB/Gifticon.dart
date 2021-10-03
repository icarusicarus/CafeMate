import 'package:sqflite/sqflite.dart';

import './DBHelper.dart';
import '../Models/Gifticon.dart';

Future<void> upsertGifticon(Gifticon? gifticon) async {
  final Database? _db = await DB.instance.database;

  if(gifticon?.id != null) {
    await _db!.update('gifticon', gifticon!.toMap(), where: 'id = ?', whereArgs: [1], conflictAlgorithm: ConflictAlgorithm.replace);
  }

  else {
     Gifticon _gifticon = Gifticon(
      g_4000: 0,
      g_6000: 0,
      g_8000: 0,
      g_10000: 0
    );
    
    await _db!.insert('gifticon', _gifticon.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }
}