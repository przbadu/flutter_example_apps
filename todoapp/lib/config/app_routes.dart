import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/app/app.dart';
import 'package:todoapp/app/tasks/presentation/task_list_calendar_page.dart';

enum AppRoute {
  home,
  tasks,
  upcomingTasks,
  labels,
  projects,
  setting,
  unauthorized,
  serverError,
}

final appRoutes = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: false,
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (context, state) => const UpcomingTaskListPage(),
      routes: [
        GoRoute(
          name: AppRoute.tasks.name,
          path: 'tasks',
          builder: (context, state) => const TaskListPage(),
          // if you need /tasks/:id, nest the route here
        ),
        GoRoute(
          name: AppRoute.upcomingTasks.name,
          path: 'tasks/upcoming',
          builder: (context, state) => const UpcomingTaskListPage(),
        ),
        GoRoute(
          name: AppRoute.setting.name,
          path: 'setting',
          builder: (context, state) => const Scaffold(), // TODO: replace this
        ),
        GoRoute(
          name: AppRoute.serverError.name,
          path: '500',
          builder: (context, state) => const InternalServerErrorPage(),
        ),
        GoRoute(
          name: AppRoute.unauthorized.name,
          path: '401',
          builder: (context, state) => const AccessDeniedPage(),
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => const NotFoundPage(),
);
