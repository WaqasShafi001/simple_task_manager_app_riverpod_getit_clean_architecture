import 'package:simple_task_manager_app/features/home/data/model/task_model.dart';

/// Abstract class defining the contract for interacting with tasks.
abstract class TaskService {
  /// Retrieves a list of tasks.
  Future<List<TaskModel>> getTasks();

  /// Adds a new task.
  Future<void> addTask(TaskModel task);

  /// Deletes a task by its ID.
  Future<void> deleteTask(String id);
}
