import 'package:injectable/injectable.dart';
import 'package:simple_task_manager_app/features/home/domain/repository/task_repository.dart';

@LazySingleton()
class DeleteTaskUseCase {
  final TaskRepository repository;

  DeleteTaskUseCase(this.repository);

  Future<void> call(String id) async => await repository.deleteTask(id);
}
