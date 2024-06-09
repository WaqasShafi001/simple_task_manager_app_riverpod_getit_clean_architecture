import 'package:flutter/material.dart';
import 'package:simple_task_manager_app/features/home/domain/entity/task_entity.dart';

/// Represents the different states of a task operation.
@immutable
abstract class TaskState {
  const TaskState();

  /// Executes the appropriate callback based on the current state.
  T when<T>({
    required T Function() initial,
    required T Function() loading,
    required T Function(List<Task> tasks) loadedSuccess,
    required T Function(String message) addedSuccess,
    required T Function(String error) failure,
  }) {
    if (this is TaskInitial) {
      return initial();
    } else if (this is TaskLoading) {
      return loading();
    } else if (this is TaskLoadedSuccess) {
      return loadedSuccess((this as TaskLoadedSuccess).tasks);
    } else if (this is TaskAddedSuccess) {
      return addedSuccess((this as TaskAddedSuccess).message);
    } else if (this is TaskFailure) {
      return failure((this as TaskFailure).error);
    } else {
      throw Exception('Unknown state: $this');
    }
  }
}

class TaskInitial extends TaskState {
  const TaskInitial();
}

class TaskLoading extends TaskState {
  const TaskLoading();
}

class TaskLoadedSuccess extends TaskState {
  final List<Task> tasks;

  const TaskLoadedSuccess(this.tasks);
}

class TaskAddedSuccess extends TaskState {
  final String message;

  const TaskAddedSuccess(this.message);
}

class TaskFailure extends TaskState {
  final String error;

  const TaskFailure(this.error);
}
