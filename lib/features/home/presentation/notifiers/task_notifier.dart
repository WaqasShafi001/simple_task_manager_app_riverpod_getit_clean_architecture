import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_task_manager_app/core/di/service_locator.dart';
import 'package:simple_task_manager_app/core/services/logger/logger.dart';
import 'package:simple_task_manager_app/features/home/domain/entity/task_entity.dart';
import 'package:simple_task_manager_app/features/home/domain/use_cases/add_task_use_case.dart';
import 'package:simple_task_manager_app/features/home/domain/use_cases/delete_task_use_case.dart';
import 'package:simple_task_manager_app/features/home/domain/use_cases/get_tasks_use_case.dart';
import 'package:simple_task_manager_app/features/home/presentation/states/task_state.dart';

/// Notifier responsible for managing the state related to tasks.
@Injectable()
class TaskNotifier extends StateNotifier<TaskState> {
  /// Use case responsible for adding tasks.
  final AddTaskUseCase addTaskUseCase;

  /// Use case responsible for retrieving tasks.
  final GetTasksUseCase getTasksUseCase;

  /// Use case responsible for deleting tasks.
  final DeleteTaskUseCase deleteTaskUseCase;

  TaskNotifier({
    required this.addTaskUseCase,
    required this.getTasksUseCase,
    required this.deleteTaskUseCase,
  }) : super(const TaskInitial());

  Future<void> addTask(Task task) async {
    state = const TaskLoading();
    try {
      await addTaskUseCase(task);
      Log.i(runtimeType, 'Task added successfully: $task');
      await getTasks();
    } catch (e) {
      state = TaskFailure(e.toString());
    }
  }

  Future<void> getTasks() async {
    state = const TaskLoading();
    try {
      final tasks = await getTasksUseCase();
      Log.i(runtimeType, 'Tasks loaded: $tasks');
      state = TaskLoadedSuccess(tasks);
    } catch (e) {
      state = TaskFailure(e.toString());
    }
  }

  Future<void> deleteTask(String taskId) async {
    state = const TaskLoading();
    try {
      await deleteTaskUseCase(taskId);
      await getTasks();
    } catch (e) {
      state = TaskFailure(e.toString());
    }
  }
}

/// Provider for the TaskNotifier.
final taskNotifierProvider = StateNotifierProvider.autoDispose<TaskNotifier, TaskState>((ref) {
  return sl<TaskNotifier>();
});
