import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_md_labs/core/data/model/todo_model.dart';
import 'package:todo_md_labs/core/data/repository/todo_repository.dart';

class AddTodoController extends GetxController {
  final TodoRepository todoRepository;

  AddTodoController({required this.todoRepository});

  late TextEditingController todoTitleController;
  RxBool isButtonActive = false.obs;

  @override
  void onInit() {
    todoTitleController = TextEditingController();
    todoTitleController.addListener(() {
      if (todoTitleController.text.isNotEmpty) {
        isButtonActive(true);
      } else {
        isButtonActive(false);
      }
    });
    super.onInit();
  }

  Future<void> addTodoItem() async {
    final todo = TodoModel(
      isChecked: false,
      title: todoTitleController.text,
    );
    await todoRepository.addTodo(todo: todo);
    Get.back();
  }

  @override
  void dispose() {
    todoTitleController.dispose();
    super.dispose();
  }
}
