import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:todo_md_labs/features/presentation/pages/todo_list_page.dart';
import 'package:todo_md_labs/routes/app_routes.dart';

class AppPages {
  AppPages._();

  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.todoList,
      page: () => const TodoListPage(),
    ),
  ];
}
