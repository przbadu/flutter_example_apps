import 'package:todoapp/app/projects/model/project.dart';

final kFakeProjects = <Project>[
  Project(
    id: 1,
    name: 'Work',
    createdAt: DateTime.now(),
    progress: 80,
    tasksCount: 10,
  ),
  Project(
    id: 2,
    name: 'Grocery List',
    createdAt: DateTime.now(),
    progress: 20,
    tasksCount: 12,
  ),
  Project(
    id: 3,
    name: 'Pokhara Tour',
    createdAt: DateTime.now(),
    progress: 90,
    tasksCount: 8,
  ),
];
