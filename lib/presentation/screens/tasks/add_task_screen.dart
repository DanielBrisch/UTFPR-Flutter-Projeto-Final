import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_final/controllers/task_controller.dart';
import 'package:projeto_final/data/models/task.dart';

class AddTaskScreen extends StatelessWidget {
  final TaskController taskController = Get.find();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adicionar Tarefa')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Descrição'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Adicionar'),
              onPressed: () {
                final task = Task(
                  id: DateTime.now().millisecondsSinceEpoch,
                  title: titleController.text,
                  description: descriptionController.text,
                  isCompleted: false,
                );
                taskController.addTask(task);
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
