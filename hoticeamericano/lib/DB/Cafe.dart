import 'package:sqflite/sqflite.dart';

import './DBHelper.dart';
import '../Models/Cafe.dart';

Future<List<Cafe>> getCafeList() async {
  final Database? _db = await DB.instance.database;
  final List<Map<String, dynamic>> _maps = await _db!.query('cafe');

  return List.generate(_maps.length, (i) {
    return Cafe(
      name: _maps[i]['name'],
      sub_name: _maps[i]['sub_name'],
      address: _maps[i]['address'],
      lat: _maps[i]['lat'],
      lon: _maps[i]['lon']
    );
  });
}