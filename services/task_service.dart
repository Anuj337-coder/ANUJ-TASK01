import '../models/task.dart';

class TaskService {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(String title) {
    _tasks.add(Task(title: title));
  }

  void toggleTask(int index) {
    _tasks[index].isDone = !_tasks[index].isDone;
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
  }
}
