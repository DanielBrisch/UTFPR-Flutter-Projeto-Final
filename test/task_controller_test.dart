import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:projeto_final/controllers/task_controller.dart';
import 'package:projeto_final/data/models/task.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  late TaskController taskController;

  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  setUp(() {
    taskController = TaskController();
  });

  tearDown(() async {
    final db = await taskController.repository.database;
    await db.delete('tasks');
    Get.reset();
  });

  test('Deve adicionar uma tarefa e verificar se ela foi adicionada com ID',
      () async {
    final task = Task(
      title: 'Tarefa de Teste',
      description: 'Descrição da tarefa de teste',
      isCompleted: false,
    );

    await taskController.addTask(task);

    expect(taskController.tasks.length, 1);
    expect(taskController.tasks[0].id != null, true);
    expect(taskController.tasks[0].title, 'Tarefa de Teste');
  });

  test('Deve editar uma tarefa existente', () async {
    final task = Task(
      title: 'Tarefa Original',
      description: 'Descrição Original',
      isCompleted: false,
    );

    await taskController.addTask(task);

    final generatedTask = taskController.tasks[0];

    final updatedTask = generatedTask.copyWith(
      title: 'Tarefa Editada',
      description: 'Descrição Editada',
    );

    await taskController.updateTask(updatedTask);

    expect(taskController.tasks.length, 1);
    expect(taskController.tasks[0].title, 'Tarefa Editada');
    expect(taskController.tasks[0].description, 'Descrição Editada');
  });

  test('Deve excluir uma tarefa existente', () async {
    final task = Task(
      title: 'Tarefa para Deletar',
      description: 'Descrição para Deletar',
      isCompleted: false,
    );

    await taskController.addTask(task);

    final generatedTask = taskController.tasks[0];

    await taskController.removeTask(generatedTask.id!);

    expect(taskController.tasks.isEmpty, true);
  });

  test('Deve verificar se a tarefa aparece após ser incluída', () async {
    final task = Task(
      title: 'Tarefa para Verificar',
      description: 'Descrição para Verificar',
      isCompleted: false,
    );

    await taskController.addTask(task);

    final generatedTask = taskController.tasks[0];

    final foundTask =
        taskController.tasks.firstWhere((t) => t.id == generatedTask.id);
    expect(foundTask.title, 'Tarefa para Verificar');
  });

  test('Deve listar todas as tarefas adicionadas', () async {
    final task1 = Task(
      id: null,
      title: 'Tarefa 1',
      description: 'Descrição 1',
      isCompleted: false,
    );

    final task2 = Task(
      id: null,
      title: 'Tarefa 2',
      description: 'Descrição 2',
      isCompleted: true,
    );

    await taskController.addTask(task1);
    await taskController.addTask(task2);

    expect(taskController.tasks.length, 2);
    expect(taskController.tasks[0].title, 'Tarefa 1');
    expect(taskController.tasks[1].title, 'Tarefa 2');
  });
}
