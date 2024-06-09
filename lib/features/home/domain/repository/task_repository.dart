import 'package:simple_task_manager_app/features/home/domain/entity/task_entity.dart';

/// Defines the interface for a [TaskRepository], responsible for managing tasks.
abstract class TaskRepository {
  Future<List<Task>> getTasks();
  Future<void> addTask(Task task);
  Future<void> deleteTask(String id);
}
