import 'package:homework_mvc_mvp/mvc/models/task.dart';
import 'package:homework_mvc_mvp/mvc/services/task_service.dart';

class TaskController {
  final TaskService _service;
  TaskController(this._service);

  List<Task> loadTask(){
    return _service.loadTask();
  }

  void addTask(String title){
    _service.addTask(title);
  }
}