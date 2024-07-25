import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_md_labs/features/todo_list/presentation/controllers/todo_list_controller.dart';
import 'package:todo_md_labs/routes/app_routes.dart';
import 'package:todo_md_labs/themes/app_colors.dart';
import 'package:todo_md_labs/themes/style.dart';

class TodoListPage extends StatelessWidget {

  final todoListController = Get.find<TodoListController>();

  TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'TODO list',
          style: bold,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Add new task', style: semiBold.copyWith(color: AppColors.fontColorWhite)),
        backgroundColor: AppColors.primaryColor,
        onPressed: () async {
          await Get.toNamed(AppRoutes.addTodo);
          todoListController.initPage();
        },
      ),
      body: _buildPage(context: context),
    );
  }

  _buildPage({required BuildContext context}) {
    return GetX<TodoListController>(builder: (controller) {
      if (controller.todoList.isEmpty) {
        return Center(
          child: Text(
            'No todo list',
            style: heavy.copyWith(fontSize: 18.sp),
          ),
        );
      } else {
        return ListView.builder(
            itemCount: controller.todoList.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsetsDirectional.symmetric(horizontal: 4.w, vertical: 1.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.primaryColor),
                ),
                child: ListTile(
                  leading: Checkbox(
                    value: controller.todoList[index].isChecked,
                    onChanged: (value) {
                      final todo = controller.todoList[index].copyWith(isChecked: value);
                      controller.changeTodoStatus(todo: todo);
                    },
                    activeColor: AppColors.primaryColor,
                  ),
                  title: Text(
                    controller.todoList[index].title,
                    style: bold,
                  ),
                ),
              );
            });
      }
    });
  }
}
