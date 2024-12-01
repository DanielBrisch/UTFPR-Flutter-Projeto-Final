import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_final/data/models/task.dart';
import 'package:projeto_final/data/repositories/api_service/tasks/task_service.dart';
import 'package:projeto_final/presentation/screens/home/home_screen.dart';
import 'package:projeto_final/presentation/screens/plataform_channel/plataform_channel.dart';
import 'package:projeto_final/presentation/screens/tasks/add_task_screen.dart';
import 'package:projeto_final/presentation/screens/tasks/edit_task_screen.dart';
import 'package:projeto_final/presentation/screens/tasks/list_task_screen.dart';
import 'package:dio/dio.dart';
import 'package:projeto_final/thema_service.dart';

void main() {
  ApiClient.init();
  Get.put(ThemeService());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
    ),
  );

  final darkTheme = ThemeData(
    primarySwatch: Colors.deepPurple,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.deepPurple,
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final ThemeService themeService = Get.find();

    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: themeService.theme,
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => const HomeScreen()),
          GetPage(name: '/list-task', page: () => TaskListScreen()),
          GetPage(name: '/add-task', page: () => AddTaskScreen()),
          GetPage(
            name: '/edit-task',
            page: () => EditTaskScreen(
              task: Get.arguments as Task,
            ),
          ),
          GetPage(
            name: '/plataform-channel',
            page: () => const PlatformChannelExample(),
          ),
        ],
      ),
    );
  }
}

class ApiClient {
  static final dio = Dio();
  static final apiService = ApiService(dio);

  static void init() {
    Get.put(apiService);
  }
}
