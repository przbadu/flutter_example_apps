import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/app/tasks/presentation/project_list_widget.dart';
import 'package:todoapp/app/tasks/presentation/task_list_widget.dart';
import 'package:todoapp/app/tasks/presentation/tasks_controller.dart';
import 'package:todoapp/extensions/extensions.dart';
import 'package:todoapp/widgets/async_value_widget.dart';

class TaskListPage extends ConsumerWidget {
  const TaskListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasksController = ref.watch(tasksControllerProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Home'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Text(
                'What\'s on your mind?'.hardcoded,
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(height: 30),
              Text(
                'Projects'.hardcoded.toUpperCase(),
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 10),
              const ProjectListWidget(),
              const SizedBox(height: 20),
              Text(
                'Tasks'.hardcoded.toUpperCase(),
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 10),
              // const TaskListWidget(),
              AsyncValueWidget(
                value: tasksController,
                data: (tasks) {
                  return TaskListWidget(tasks: tasks);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
