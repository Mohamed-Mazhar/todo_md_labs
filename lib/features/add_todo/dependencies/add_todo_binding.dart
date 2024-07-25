import 'package:get/get.dart';
import 'package:todo_md_labs/core/data/repository/todo_repository.dart';
import 'package:todo_md_labs/features/add_todo/presentation/controllers/add_todo_controller.dart';

class AddTodoBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => TodoRepository());
    Get.lazyPut(() => AddTodoController(todoRepository: Get.find<TodoRepository>()));
  }

}