import 'dart:async';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:todo_md_labs/core/data/database/todo_database.dart';

class DatabaseFfiManager {
  static Future<Database> initDatabase() async {
    final Completer<Database> completer = Completer<Database>();
    sqfliteFfiInit();
    TodoDatabase.database = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath,
        options: OpenDatabaseOptions(
            version: 1,
            onOpen: (database) async {
              await TodoDatabase.createDatabaseTablesIfNotExists(database: database);
              completer.complete(database);
            }));
    return completer.future;
  }

  static Future<void> deleteDatabase() async {
    await databaseFactoryFfi.deleteDatabase(inMemoryDatabasePath);
  }
}
