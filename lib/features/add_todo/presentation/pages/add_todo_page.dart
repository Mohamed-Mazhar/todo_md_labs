import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_md_labs/core/widgets/app_primary_button.dart';
import 'package:todo_md_labs/core/widgets/text_input.dart';
import 'package:todo_md_labs/features/add_todo/presentation/controllers/add_todo_controller.dart';
import 'package:todo_md_labs/themes/app_colors.dart';
import 'package:todo_md_labs/themes/style.dart';

class AddTodoPage extends StatelessWidget {
  const AddTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add todo', style: bold),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_sharp,
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: GetX<AddTodoController>(
        builder: (controller) {
          return Container(
            margin: EdgeInsetsDirectional.symmetric(horizontal: 4.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextInput(
                  label: 'Insert new item',
                  textEditingController: controller.todoTitleController,
                ),
                SizedBox(height: 2.h),
                AppPrimaryButton(
                  text: 'Add',
                  isEnabled: controller.isButtonActive.value,
                  onTap: () async {
                    await controller.addTodoItem();
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
