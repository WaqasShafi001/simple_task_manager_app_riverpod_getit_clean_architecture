import 'package:flutter/material.dart';
import 'package:simple_task_manager_app/core/constants/app_strings.dart';
import 'package:simple_task_manager_app/core/extentions/widget_extension.dart';

class AddTaskDialog extends StatelessWidget {
  const AddTaskDialog({
    super.key,
    required this.titleController,
  });

  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: titleController,
          decoration: const InputDecoration(
            hintText: AppStrings.enterTaskTitle,
          ),
        ),
      ],
    ).paddingOnly(bottom: 20.0);
  }
}
