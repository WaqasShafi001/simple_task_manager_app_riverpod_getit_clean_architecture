import 'package:injectable/injectable.dart';
import 'package:simple_task_manager_app/core/services/logger/logger.dart';
import 'package:simple_task_manager_app/features/home/data/data_source/local/task_service.dart';
import 'package:simple_task_manager_app/features/home/data/model/task_model.dart';
import 'package:simple_task_manager_app/features/home/domain/entity/task_entity.dart';
import 'package:simple_task_manager_app/features/home/domain/repository/task_repository.dart';

/// Implementation of the [TaskRepository] interface responsible for interacting with the [TaskService].
@LazySingleton(as: TaskRepository)
class TaskRepositoryImpl implements TaskRepository {
  final TaskService _taskService;

  TaskRepositoryImpl(this._taskService);

  @override
  Future<List<TaskModel>> getTasks() async {
    final tasks = await _taskService.getTasks();
    Log.i(runtimeType, 'Repository fetched tasks: $tasks');
    return tasks;
  }

  @override
  Future<void> deleteTask(String id) async => await _taskService.deleteTask(id);

  @override
  Future<void> addTask(Task task) async {
    TaskModel taskModel = TaskModel(id: task.id, title: task.title);
    await _taskService.addTask(taskModel);
    Log.i(runtimeType, 'Repository added task: $taskModel');
  }
}
