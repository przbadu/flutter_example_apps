import 'package:todoapp/app/tasks/model/task.dart';

final kFakeTasks = <Task>[
  Task(
    id: 1,
    title: 'Daily standup meeting',
    projectId: 1,
    createdAt: DateTime.now(),
  ),
  Task(
    id: 2,
    title: 'Dev standup meeting',
    projectId: 1,
    createdAt: DateTime.now(),
    isCompleted: true,
  ),
  Task(
    id: 3,
    title: 'Friday Show and Tell',
    projectId: 1,
    createdAt: DateTime.now(),
  ),
  Task(
    id: 4,
    title: 'Milk',
    dateTime: DateTime.now().add(const Duration(hours: 1)),
    projectId: 2,
    createdAt: DateTime.now(),
  ),
  Task(
    id: 5,
    title: 'Paneer',
    dateTime: DateTime.now().add(const Duration(hours: 1)),
    projectId: 2,
    createdAt: DateTime.now(),
    isCompleted: true,
  ),
  Task(
    id: 6,
    title: 'Chicken Breast',
    dateTime: DateTime.now().add(const Duration(hours: 1)),
    projectId: 2,
    createdAt: DateTime.now(),
  ),
  Task(
    id: 7,
    title: 'Olive Oil',
    dateTime: DateTime.now().add(const Duration(hours: 1)),
    projectId: 1,
    createdAt: DateTime.now(),
    isCompleted: true,
  ),
  Task(
    id: 8,
    title: 'Kasmari Lal Mirch',
    dateTime: DateTime.now().add(const Duration(hours: 1)),
    projectId: 2,
    createdAt: DateTime.now(),
  ),
  Task(
    id: 9,
    title: 'Collect money',
    projectId: 3,
    createdAt: DateTime.now(),
  ),
  Task(
    id: 10,
    title: 'Finalize the date',
    projectId: 3,
    createdAt: DateTime.now(),
  ),
  Task(
    id: 11,
    title: 'Search for hotels',
    projectId: 3,
    createdAt: DateTime.now(),
  ),
  Task(
    id: 12,
    title: 'Reasearch nearby places',
    projectId: 3,
    createdAt: DateTime.now(),
  ),
  Task(
    id: 13,
    title: 'Book a guide',
    projectId: 3,
    createdAt: DateTime.now(),
  ),
];