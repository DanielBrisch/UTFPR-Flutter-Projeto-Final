import 'package:get/get.dart';
import '../data/models/task.dart';
import '../data/repositories/task_repository.dart';

class TaskController extends GetxController {
  final TaskRepository repository = TaskRepository();
  var tasks = <Task>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadTasks();
  }

  void loadTasks() async {
    final loadedTasks = await repository.getAllTasks();
    tasks.assignAll(loadedTasks);
  }

  Future<void> addTask(Task task) async {
    final id = await repository.addTask(task);
    final newTask = task.copyWith(id: id);
    tasks.add(newTask);
  }

  Future<void> removeTask(int id) async {
    await repository.deleteTask(id);
    tasks.removeWhere((task) => task.id == id);
  }

  Future<void> updateTask(Task task) async {
    await repository.updateTask(task);
    final index = tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      tasks[index] = task;
    }
  }
}
