import 'package:injectable/injectable.dart';
import 'package:simple_task_manager_app/features/home/domain/entity/task_entity.dart';
import 'package:simple_task_manager_app/features/home/domain/repository/task_repository.dart';

@LazySingleton()
class GetTasksUseCase {
  final TaskRepository repository;

  GetTasksUseCase(this.repository);

  Future<List<Task>> call() async => await repository.getTasks();
}
