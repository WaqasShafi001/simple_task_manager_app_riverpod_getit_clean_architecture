import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:simple_task_manager_app/config/routes/routes.gr.dart';
import 'package:simple_task_manager_app/core/constants/app_strings.dart';
import 'package:simple_task_manager_app/core/extentions/build_context_extension.dart';
import 'package:simple_task_manager_app/core/extentions/widget_extension.dart';
import 'package:simple_task_manager_app/core/widgets/button/app_button.dart';
import 'package:simple_task_manager_app/core/widgets/scaffold/app_scaffold.dart';

@RoutePage()
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStrings.welcome,
            style: context.titleLarge,
          ),
          AppButton(
            onPressed: () => context.pushRoute(const HomeRoute()),
            child: const Text(AppStrings.goToHomePage),
          ),
        ],
      ).childrenPadding(const EdgeInsets.symmetric(vertical: 20.0)).paddingSymmetric(horizontal: 16.0),
    );
  }
}
