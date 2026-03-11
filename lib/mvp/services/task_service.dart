import 'package:homework_mvc_mvp/mvc/models/task.dart';

class TaskService {
  final List<Task> _tasks = [];

  List<Task> loadTask() {
    return _tasks;
  }

  void addTask(String title) {
    if(title.trim().isEmpty){
      throw Exception('Task title cannot be empty');
    }

    _tasks.add(Task(title: title));
  }
}
