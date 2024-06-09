import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_task_manager_app/core/constants/app_strings.dart';
import 'package:simple_task_manager_app/core/extentions/build_context_extension.dart';
import 'package:simple_task_manager_app/core/widgets/appbar/my_app_bar.dart';
import 'package:simple_task_manager_app/core/widgets/button/app_button.dart';
import 'package:simple_task_manager_app/core/widgets/scaffold/app_scaffold.dart';
import 'package:simple_task_manager_app/features/home/domain/entity/task_entity.dart';
import 'package:simple_task_manager_app/features/home/presentation/notifiers/task_notifier.dart';
import 'package:simple_task_manager_app/features/home/presentation/widgets/add_task_dialog.dart';
import 'package:simple_task_manager_app/features/home/presentation/widgets/task_tile.dart';

@RoutePage()
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    // Calls the getTasks method after the first frame is rendered.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(taskNotifierProvider.notifier).getTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Watches the taskNotifierProvider for changes in task state.
    final taskState = ref.watch(taskNotifierProvider);

    return AppScaffold(
      appBar: MyAppbar(
        title: const Text(AppStrings.tasks),
        backgroundColor: context.primaryContainer,
        actions: [
          AppButton.onlyIcon(
            onPressed: () => _showAddTaskDialog(context),
            icon: CircleAvatar(
              backgroundColor: context.primary,
              child: Icon(Icons.add, color: context.scaffoldBackgroundColor),
            ),
          ),
        ],
      ),
      body: taskState.when(
        initial: () => const Center(child: CircularProgressIndicator()),
        loading: () => const Center(child: CircularProgressIndicator()),
        loadedSuccess: (tasks) {
          if (tasks.isEmpty) {
            return const Center(child: Text(AppStrings.noTasksAvailable));
          }
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return TaskTile(task: task, ref: ref);
            },
          );
        },
        addedSuccess: (message) {
          context.showSnackBar(message);
          return const SizedBox.shrink();
        },
        failure: (error) => Center(child: Text('${AppStrings.error} $error')),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    final titleController = TextEditingController();
    context.showAppGeneralDialog(
      child: AddTaskDialog(titleController: titleController),
      actions: [
        AppButton.shrink(
          width: context.width * 0.3,
          onPressed: () => Navigator.pop(context),
          child: const Text(AppStrings.cancel),
        ),
        AppButton.shrink(
          width: context.width * 0.3,
          onPressed: () {
            final title = titleController.text.trim();
            if (title.isNotEmpty) {
              final task = Task(id: DateTime.now().millisecondsSinceEpoch.toString(), title: title);
              ref.read(taskNotifierProvider.notifier).addTask(task);
              Navigator.pop(context);
            }
          },
          child: const Text(AppStrings.add),
        ),
      ],
    );
  }
}
