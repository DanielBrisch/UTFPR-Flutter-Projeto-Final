import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_final/controllers/task_controller.dart';
import 'package:projeto_final/data/models/task.dart';

class EditTaskScreen extends StatelessWidget {
  final TaskController taskController = Get.find();
  final Task task;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  EditTaskScreen({super.key, required this.task}) {
    titleController.text = task.title;
    descriptionController.text = task.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar Tarefa')),
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
              child: const Text('Salvar Alterações'),
              onPressed: () {
                final updatedTask = task.copyWith(
                  title: titleController.text,
                  description: descriptionController.text,
                );

                taskController.updateTask(updatedTask);

                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
