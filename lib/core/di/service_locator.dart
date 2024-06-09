import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_task_manager_app/core/di/service_locator.config.dart';

/// sl is the service locator
final sl = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)

/// This function initializes the service locator and registers dependencies.
/// It should be called before accessing any registered dependencies.
Future<void> configureDependencies() async => await sl.init();
