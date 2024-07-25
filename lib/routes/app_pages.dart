import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:todo_md_labs/features/add_todo/dependencies/add_todo_binding.dart';
import 'package:todo_md_labs/features/add_todo/presentation/pages/add_todo_page.dart';
import 'package:todo_md_labs/features/todo_list/dependencies/todo_list_binding.dart';
import 'package:todo_md_labs/features/todo_list/presentation/pages/todo_list_page.dart';
import 'package:todo_md_labs/routes/app_routes.dart';

class AppPages {
  AppPages._();

  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.todoList,
      page: () =>  TodoListPage(),
      binding: TodoListBinding(),
    ),
    GetPage(
      name: AppRoutes.addTodo,
      page: () => const AddTodoPage(),
      binding: AddTodoBinding(),
    )
  ];
}
