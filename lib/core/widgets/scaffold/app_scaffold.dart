import 'package:flutter/material.dart';
import 'package:simple_task_manager_app/core/extentions/build_context_extension.dart';

/// A custom scaffold widget with background color support.
class AppScaffold extends StatelessWidget {
  final Widget? body;
  final Widget? drawer;
  final Key? scaffoldKey;
  final PreferredSizeWidget? appBar;

  const AppScaffold({
    this.drawer,
    this.appBar,
    this.body,
    super.key,
    this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: ColoredBox(color: context.scaffoldBackgroundColor)),
        Positioned.fill(
          child: Scaffold(
            key: scaffoldKey,
            drawerScrimColor: context.primary.withOpacity(0.75),
            drawer: drawer,
            backgroundColor: Colors.transparent,
            appBar: appBar,
            body: body,
          ),
        ),
      ],
    );
  }
}
