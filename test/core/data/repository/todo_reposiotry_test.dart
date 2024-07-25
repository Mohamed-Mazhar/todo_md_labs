import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:todo_md_labs/core/data/database/tables/todo_list_table.dart';
import 'package:todo_md_labs/core/data/model/todo_model.dart';
import 'package:todo_md_labs/core/data/repository/todo_repository.dart';

import '../../../test_util/database_ffi_manager.dart';

Future<void> main() async {
  late TodoRepository todoRepository;
  final Database database = await DatabaseFfiManager.initDatabase();

  setUpAll(() {
    todoRepository = TodoRepository();
  });

  tearDownAll(() async {
    await database.close();
  });

  test('add todo item', () async {
    await database.delete(TodoListTable.tableName);
    await todoRepository.addTodo(todo: const TodoModel(isChecked: false, title: 'test'));
    final result = await database.query(TodoListTable.tableName);
    const expected = {TodoListTable.checkedColumn: 0, TodoListTable.titleColumn: 'test', TodoListTable.idColumn: 1};
    expect(result, [expected]);
  });

  group('get todo list', () {
    test('get todo returns empty map', () async {
      database.delete(TodoListTable.tableName);
      final result = await todoRepository.get();
      expect(result, []);
    });

    test('get todo list returns list of todos', () async {
      database.delete(TodoListTable.tableName);
      final todo1 = {TodoListTable.titleColumn: 'test1', TodoListTable.checkedColumn: 0};
      final todo2 = {TodoListTable.titleColumn: 'test2', TodoListTable.checkedColumn: 1};
      final expectedResult = [
        const TodoModel(isChecked: false, title: 'test1', id: 2),
        const TodoModel(isChecked: true, title: 'test2', id: 3),
      ];
      await database.insert(TodoListTable.tableName, todo1);
      await database.insert(TodoListTable.tableName, todo2);
      final result = await todoRepository.get();
      expect(result, expectedResult);
    });
  });

  test('update todo list check then returns updated todo', () async {
    const todo = TodoModel(isChecked: false, title: 'test3', id: 4);
    const todoMap = {
      TodoListTable.checkedColumn: 0,
      TodoListTable.titleColumn: 'test3',
    };
    await database.delete(TodoListTable.tableName);
    await database.insert(TodoListTable.tableName, todoMap);
    final getTodo = await database.query(TodoListTable.tableName);
    expect(getTodo.length, 1);
    await todoRepository.update(todo: todo.copyWith(isChecked: true));
    final updatedTodo = await database.query(TodoListTable.tableName);
    expect(updatedTodo, [
      {
        TodoListTable.checkedColumn: 1,
        TodoListTable.titleColumn: 'test3',
        TodoListTable.idColumn: 4
      }
    ]);
  });
}
