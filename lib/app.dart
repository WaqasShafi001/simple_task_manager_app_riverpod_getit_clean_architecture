import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_task_manager_app/config/routes/routes.dart';
import 'package:simple_task_manager_app/config/theme/theme_dart.dart';
import 'package:simple_task_manager_app/config/theme/theme_light.dart';
import 'package:simple_task_manager_app/core/constants/app_strings.dart';

// Create global keys for the navigator and scaffold messenger.
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

// Define the root widget of the application.
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

// Define the state for the root widget.
class _AppState extends State<App> {
  final AppRouter _routes = AppRouter(navigatorKey);

  @override
  Widget build(BuildContext context) {
    // Provide access to the Riverpod providers.
    return ProviderScope(
      child: MaterialApp.router(
        scaffoldMessengerKey: scaffoldMessengerKey, // Set the scaffold messenger key.
        debugShowCheckedModeBanner: false,
        title: AppStrings.welcome,
        theme: ThemeLight().themeData,
        darkTheme: ThemeDark().themeData,
        themeMode: ThemeMode.light, // Set the default theme mode.
        // Configure the router using the app router config.
        routerConfig: _routes.config(navigatorObservers: () => [AppRouteObserver()]),
      ),
    );
  }
}
