import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:convert';

import '../Models/Cafe.dart';

class DB {
  static const databaseName = "1.db";
  static Database? _database;

  DB._privateConstructor();
  static final DB instance = DB._privateConstructor();

  Future<Database?> get database async {
    if(_database == null) return await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    return await openDatabase(
      join(await getDatabasesPath(), databaseName),
      version: 1,
      onCreate: _onCreate
    );
  }
}

void _onCreate(Database db, _) async {
  await db.execute("CREATE TABLE user (id INTEGER PRIMARY KEY NOT NULL, user_number TEXT NOT NULL, kind INTEGER NOT NULL, name TEXT NOT NULL, email TEXT)");
  await db.execute("CREATE TABLE cafe (id INTEGER PRIMARY KEY NOT NULL, name TEXT, sub_name TEXT, address TEXT, lat REAL, lon REAL)");
  await db.execute("CREATE TABLE gifticon (id INTEGER PRIMARY KEY NOT NULL, g_4000 INTEGER, g_6000 INTEGER, g_8000 INTEGER, g_10000 INTEGER)");

  print('seed start');
  final String jsonFile = await rootBundle.loadString('assets/cafe.json');
  final data = await json.decode(jsonFile);

  for(final i in data) {
    Cafe _cafe = Cafe(
      name: i['name'],
      sub_name: i['sub_name'],
      address: i['address'],
      lat: i['lat'],
      lon: i['lon']
    );
    db.insert('cafe', _cafe.toMap(), conflictAlgorithm: ConflictAlgorithm.fail);
  }
  print('seed end');
}