import 'package:get/get.dart';
import 'package:todo_md_labs/core/data/repository/todo_repository.dart';
import 'package:todo_md_labs/features/todo_list/presentation/controllers/todo_list_controller.dart';

class TodoListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TodoRepository());
    Get.lazyPut(() => TodoListController(todoRepository: Get.find<TodoRepository>()));
  }

}