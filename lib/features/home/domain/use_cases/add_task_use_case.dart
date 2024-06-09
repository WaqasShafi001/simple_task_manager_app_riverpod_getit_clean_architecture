import 'package:injectable/injectable.dart';
import 'package:simple_task_manager_app/features/home/domain/entity/task_entity.dart';
import 'package:simple_task_manager_app/features/home/domain/repository/task_repository.dart';

/// Use case responsible for adding a new task.
@LazySingleton()
class AddTaskUseCase {
  /// The repository used for adding tasks.
  final TaskRepository repository;

  AddTaskUseCase(this.repository);

  /// Adds the specified task to the repository.
  Future<void> call(Task task) async => await repository.addTask(task);
}
