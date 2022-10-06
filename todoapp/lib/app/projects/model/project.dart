import 'package:equatable/equatable.dart';

class Project extends Equatable {
  final int id;
  final String name;
  final double progress;
  final int tasksCount;
  final DateTime createdAt;
  const Project({
    required this.id,
    required this.name,
    this.progress = 0.0,
    this.tasksCount = 0,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, name, createdAt];
}
