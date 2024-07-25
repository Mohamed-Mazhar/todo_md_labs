import 'package:todo_md_labs/core/data/database/tables/todo_list_table.dart';
import 'package:todo_md_labs/core/data/database/todo_database.dart';
import 'package:todo_md_labs/core/data/model/todo_model.dart';

class TodoRepository {
  final _database = TodoDatabase.database;

  Future<List<TodoModel>> get() async {
    final todoMaps = await _database!.query(TodoListTable.tableName);
    final List<TodoModel> todos = [];
    for (final Map<String, dynamic> todoMap in todoMaps) {
      todos.add(TodoModel(
        id: todoMap['id'],
        isChecked: todoMap['checked'] == 1 ? true : false,
        title: todoMap['title'],
      ));
    }
    return todos;
  }

  Future<int> addTodo({required TodoModel todo}) async {
    final todoMap = todo.toMap();
    return TodoDatabase.database!.insert(TodoListTable.tableName, todoMap);
  }

  Future<void> update({required TodoModel todo}) async {
    final todoMap = todo.toMap();
    await _database!.update(
      TodoListTable.tableName,
      todoMap,
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }
}
