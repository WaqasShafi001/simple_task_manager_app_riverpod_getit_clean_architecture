// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/home/data/data_source/local/task_service.dart' as _i5;
import '../../features/home/data/data_source/local/task_service_impl.dart'
    as _i6;
import '../../features/home/data/repository/task_repository_impl.dart' as _i8;
import '../../features/home/domain/repository/task_repository.dart' as _i7;
import '../../features/home/domain/use_cases/add_task_use_case.dart' as _i9;
import '../../features/home/domain/use_cases/delete_task_use_case.dart' as _i10;
import '../../features/home/domain/use_cases/get_tasks_use_case.dart' as _i11;
import '../../features/home/presentation/notifiers/task_notifier.dart' as _i12;
import '../services/storage/hive_storage_service.dart' as _i4;
import '../services/storage/storage_service.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    await gh.lazySingletonAsync<_i3.StorageService<dynamic>>(
      () {
        final i = _i4.HiveStorageService<dynamic>();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.factory<_i5.TaskService>(
        () => _i6.TaskServiceImpl(gh<_i3.StorageService<dynamic>>()));
    gh.lazySingleton<_i7.TaskRepository>(
        () => _i8.TaskRepositoryImpl(gh<_i5.TaskService>()));
    gh.lazySingleton<_i9.AddTaskUseCase>(
        () => _i9.AddTaskUseCase(gh<_i7.TaskRepository>()));
    gh.lazySingleton<_i10.DeleteTaskUseCase>(
        () => _i10.DeleteTaskUseCase(gh<_i7.TaskRepository>()));
    gh.lazySingleton<_i11.GetTasksUseCase>(
        () => _i11.GetTasksUseCase(gh<_i7.TaskRepository>()));
    gh.factory<_i12.TaskNotifier>(() => _i12.TaskNotifier(
          addTaskUseCase: gh<_i9.AddTaskUseCase>(),
          getTasksUseCase: gh<_i11.GetTasksUseCase>(),
          deleteTaskUseCase: gh<_i10.DeleteTaskUseCase>(),
        ));
    return this;
  }
}
