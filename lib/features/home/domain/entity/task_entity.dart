import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task_entity.g.dart';

/// Represents a Task model class annotated for Hive and JSON serialization.
@HiveType(typeId: 0)
@JsonSerializable()
class Task extends HiveObject {
  /// The unique identifier of the task.
  @HiveField(0)
  final String id;

  /// The title of the task.
  @HiveField(1)
  final String title;

  Task({required this.id, required this.title});

  /// Constructs a Task instance from a JSON map.
  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  /// Converts the Task instance to a JSON map.
  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
