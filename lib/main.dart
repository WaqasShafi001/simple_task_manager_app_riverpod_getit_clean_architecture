import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_task_manager_app/app.dart';
import 'package:simple_task_manager_app/core/di/service_locator.dart';

void main() async {
  // Ensure that Flutter widgets are initialized.
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive database if not running on web.
  if (!kIsWeb) {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
  }

  // Setup service locator for dependency injection.
  await configureDependencies();
  // Run the application.
  runApp(const App());
}
