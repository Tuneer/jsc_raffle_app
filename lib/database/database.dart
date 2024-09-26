import 'dart:async';

import 'package:floor/floor.dart';
import 'package:flutter/foundation.dart';
import '../../dao/receipt_detail_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../models/receipt_detail_model.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [ReceiptDetailModel])
abstract class AppDatabase extends FloorDatabase {
  ReceiptDetailDao get receiptListDataDao;
}

Future<AppDatabase> openDatabase() async {
  final AppDatabase database = await $FloorAppDatabase
      .databaseBuilder('raffle_app.db')
      .addCallback(Callback(
    onUpgrade: (database, oldVersion, newVersion) async {
      if (kDebugMode) {
        print('table: onUpgrade $oldVersion $newVersion');
      }
      if (oldVersion < newVersion) {
        try {} catch (e) {
          if (kDebugMode) {
            print(e);
          }
        }
      }
    },
  )).build();
  return database;
}
