import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:simple_task_manager_app/core/services/logger/logger.dart';
import 'package:simple_task_manager_app/core/services/storage/storage_service.dart';
import 'package:simple_task_manager_app/features/home/data/data_source/local/task_service.dart';
import 'package:simple_task_manager_app/features/home/data/model/task_model.dart';

/// Implementation of the [TaskService] interface using a storage service.
@Injectable(as: TaskService)
class TaskServiceImpl implements TaskService {
  final StorageService _storageService;

  /// Constructs a [TaskServiceImpl] instance with the provided [StorageService].
  TaskServiceImpl(this._storageService);

  @override
  Future<List<TaskModel>> getTasks() async {
    final keys = await _storageService.keys();
    final tasks = <TaskModel>[];
    for (var key in keys) {
      final taskJson = await _storageService.read<String>(key);
      if (taskJson != null) {
        final task = TaskModel.fromJson(jsonDecode(taskJson));
        tasks.add(task);
      }
    }
    Log.i(runtimeType, 'Fetched tasks: $tasks');
    return tasks;
  }

  @override
  Future<void> addTask(TaskModel task) async {
    final taskJson = jsonEncode(task.toJson());
    await _storageService.write(task.id, taskJson);
    Log.i(runtimeType, 'Task added: $task');
  }

  @override
  Future<void> deleteTask(String id) async {
    await _storageService.delete(id);
    Log.i(runtimeType, 'Task deleted: $id');
  }
}
