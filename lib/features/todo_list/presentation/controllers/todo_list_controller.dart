import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:todo_md_labs/core/data/model/todo_model.dart';
import 'package:todo_md_labs/core/data/repository/todo_repository.dart';

class TodoListController extends GetxController {
  
  final TodoRepository todoRepository;

  TodoListController({required this.todoRepository});
  
  RxList<TodoModel> todoList = RxList();
  
  @override
  void onInit() async {
    initPage();
    super.onInit();
  }
  
  Future<void> changeTodoStatus({required TodoModel todo}) async {
    debugPrint("Changing todo to ${todo.id} and is ${todo.isChecked}");
    await todoRepository.update(todo: todo);
    initPage();
  }

  Future<void> initPage() async {
    final todos = await todoRepository.get();
    todoList.assignAll(todos);
  }
  
}