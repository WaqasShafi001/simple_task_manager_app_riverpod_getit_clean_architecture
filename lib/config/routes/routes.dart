import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:simple_task_manager_app/config/routes/routes.gr.dart';
import 'package:simple_task_manager_app/core/services/logger/logger.dart';

part 'auto_router_observer.dart';

// Configure the app router using the AutoRouterConfig annotation.
@AutoRouterConfig()
class AppRouter extends $AppRouter {
  // Define the navigator key for navigation management.
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  // Initialize the app router with the navigator key.
  AppRouter(this.navigatorKey) : super(navigatorKey: navigatorKey);

  // Define the route paths for the application.
  static const String _welcome = '/welcome';
  static const String _home = '/home';

  // Specify the default route type.
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  // Define the list of routes for the application.
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: WelcomeRoute.page, initial: true, path: _welcome),
        AutoRoute(page: HomeRoute.page, path: _home),
      ];
  // Define route observers for navigation events.
  List<RouteObserver> get observers => [RouteObserver()];
}
