import 'package:flutter/material.dart';
import 'package:homework_mvc_mvp/mvc/views/task_screen_mvc.dart';
// import 'package:homework_mvc_mvp/mvp/views/task_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TaskScreenMVC(),
      // home: const TaskScreenMVP(),
    );
  }
}
