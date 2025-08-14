import 'package:flutter/material.dart';
import '../services/task_service.dart';
import '../widgets/task_tile.dart';
import 'add_task_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TaskService _taskService = TaskService();

  void _navigateToAddTask() async {
    final newTaskTitle = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddTaskPage()),
    );

    if (newTaskTitle != null && newTaskTitle.toString().isNotEmpty) {
      setState(() {
        _taskService.addTask(newTaskTitle);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Day Planner"),
        centerTitle: true,
      ),
      body: _taskService.tasks.isEmpty
          ? const Center(
              child: Text("No tasks yet. Add one!"),
            )
          : ListView.builder(
              itemCount: _taskService.tasks.length,
              itemBuilder: (context, index) {
                final task = _taskService.tasks[index];
                return TaskTile(
                  task: task,
                  onToggle: () {
                    setState(() {
                      _taskService.toggleTask(index);
                    });
                  },
                  onDelete: () {
                    setState(() {
                      _taskService.deleteTask(index);
                    });
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}
