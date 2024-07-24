import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as services;
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_md_labs/core/data/database/todo_database.dart';
import 'package:todo_md_labs/routes/app_pages.dart';
import 'package:todo_md_labs/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TodoDatabase.initializeDatabase();
  services.SystemChrome.setSystemUIOverlayStyle(const services.SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, //top bar color
    statusBarIconBrightness: Brightness.dark, //top bar icons
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'TODO',
          theme: ThemeData(useMaterial3: true),
          initialRoute: AppRoutes.todoList,
          getPages: AppPages.pages,
        );
      },
    );
  }
}
