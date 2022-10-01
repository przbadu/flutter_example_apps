import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final int id;
  final String title;
  final String description;
  final bool isCompleted;
  final DateTime? dateTime;
  final DateTime createdAt;
  final int projectId; // belongs to
  const Task({
    required this.id,
    required this.title,
    this.dateTime,
    required this.createdAt,
    required this.projectId,
    this.description = '',
    this.isCompleted = false,
  });

  @override
  List<Object?> get props =>
      [id, title, description, isCompleted, dateTime, projectId, createdAt];

  @override
  String toString() {
    return 'Task(id: $id, title: $title, description: $description, isCompleted: $isCompleted, dateTime: $dateTime, createdAt: $createdAt, projectId: $projectId)';
  }
}
