import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_md_labs/themes/app_colors.dart';
import 'package:todo_md_labs/themes/style.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

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
        label: Text('Add new task', style: semiBold),
        backgroundColor: AppColors.primaryColor,
        onPressed: () {},
      ),
      body: _buildPage(context: context),
    );
  }

  _buildPage({required BuildContext context}) {
    return Container(
      margin: EdgeInsetsDirectional.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primaryColor),
      ),
      child: ListTile(
        leading: Checkbox(
          value: true,
          onChanged: (value) {

          },
          activeColor: AppColors.primaryColor,
        ),
        title: Text('test', style: bold),
      ),
    );
  }
}
