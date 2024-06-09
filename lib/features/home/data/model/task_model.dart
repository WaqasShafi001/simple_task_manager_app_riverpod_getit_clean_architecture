import 'package:json_annotation/json_annotation.dart';
import 'package:simple_task_manager_app/features/home/domain/entity/task_entity.dart';
part 'task_model.g.dart';

/// Represents a task model, extending the base task class and serializable to/from JSON.
@JsonSerializable()
class TaskModel extends Task {
  TaskModel({
    required super.id,
    required super.title,
  });

  /// Constructs a TaskModel instance from a JSON map.
  factory TaskModel.fromJson(Map<String, dynamic> json) => _$TaskModelFromJson(json);

  /// Converts this TaskModel instance to a JSON map.
  @override
  Map<String, dynamic> toJson() => _$TaskModelToJson(this);
}
