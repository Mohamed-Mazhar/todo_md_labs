import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_md_labs/core/data/database/tables/todo_list_table.dart';

class TodoDatabase {
  static Database? database;

  static Future<void> initializeDatabase() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'todo_md_labs.db'),
      version: 1,
      onOpen: (Database db) async {
        await _createDatabaseTablesIfNotExists(database: db);
      },
    );
  }

  static Future<void> _createDatabaseTablesIfNotExists({
    required Database database,
  }) async {
    final batch = database.batch();
    batch.execute(TodoListTable.tableCreation);
    await batch.commit(noResult: true);
  }
}
