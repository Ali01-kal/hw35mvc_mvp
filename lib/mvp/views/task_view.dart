import 'package:homework_mvc_mvp/mvc/models/task.dart';

abstract class TaskView {
  void showTasks(List<Task> tasks);
  void showError(String message);
  void clearInput();
}
