import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_task_manager_app/core/extentions/build_context_extension.dart';
import 'package:simple_task_manager_app/core/extentions/widget_extension.dart';
import 'package:simple_task_manager_app/core/widgets/button/app_button.dart';
import 'package:simple_task_manager_app/core/widgets/card/my_card.dart';
import 'package:simple_task_manager_app/features/home/domain/entity/task_entity.dart';
import 'package:simple_task_manager_app/features/home/presentation/notifiers/task_notifier.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
    required this.ref,
  });

  final Task task;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return MyCard(
      shadowColor: context.primaryContainer,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            task.title,
            style: context.titleMedium.copyWith(fontWeight: FontWeight.w500, color: context.secondary),
          ).paddingOnly(left: 16.0),
          AppButton.onlyIcon(
            onPressed: () => ref.read(taskNotifierProvider.notifier).deleteTask(task.id),
            icon: Icon(Icons.delete, color: context.secondary),
          ),
        ],
      ),
    ).paddingSymmetric(horizontal: 16.0, vertical: 5.0);
  }
}
