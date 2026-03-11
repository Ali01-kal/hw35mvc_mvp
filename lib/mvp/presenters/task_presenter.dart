import 'package:homework_mvc_mvp/mvc/services/task_service.dart';
import 'package:homework_mvc_mvp/mvp/utils/error_handler.dart';
import 'package:homework_mvc_mvp/mvp/views/task_view.dart';

class TaskPresenter {
  final TaskService service;
  final TaskView view;

  TaskPresenter({
    required this.service,
    required this.view,
  });

  void loadTask() {
    try{
      final tasks = service.loadTask();
      view.showTasks(tasks);
    } catch(e){
      view.showError(ErrorHandler.handle(e));
    }
  }

  void addTask(String title){
    try{
      service.addTask(title);
      view.clearInput();
      loadTask();
    }catch(e){
      view.showError(ErrorHandler.handle(e));
    }
  }
}
