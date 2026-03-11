import 'package:flutter/material.dart';
import 'package:homework_mvc_mvp/mvc/models/task.dart';
import 'package:homework_mvc_mvp/mvc/services/task_service.dart';
import '../presenters/task_presenter.dart';

import 'task_view.dart';

class TaskScreenMVP extends StatefulWidget {
  const TaskScreenMVP({super.key});

  @override
  State<TaskScreenMVP> createState() => _TaskScreenMVPState();
}

class _TaskScreenMVPState extends State<TaskScreenMVP> implements TaskView {
  late TaskPresenter presenter;
  final TextEditingController textController = TextEditingController();

  List<Task> tasks = [];
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    presenter = TaskPresenter(
      service: TaskService(),
      view: this,
    );
    presenter.loadTask();
  }

  @override
  void showTasks(List<Task> tasks) {
    setState(() {
      this.tasks = tasks;
      errorMessage = null;
    });
  }

  @override
  void showError(String message) {
    setState(() {
      errorMessage = message;
    });
  }

  @override
  void clearInput() {
    textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks MVP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                labelText: 'Enter task',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => presenter.addTask(textController.text),
              child: const Text('Add Task'),
            ),
            const SizedBox(height: 10),
            if (errorMessage != null)
              Text(
                errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(tasks[index].title),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
