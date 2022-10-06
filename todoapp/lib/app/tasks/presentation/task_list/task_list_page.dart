import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/app/tasks/presentation/widgets/project_list_widget.dart';
import 'package:todoapp/app/tasks/presentation/widgets/task_list_widget.dart';

class TaskListPage extends ConsumerWidget {
  const TaskListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              const SizedBox(height: 20),
              Text(
                'Projects',
                style: Theme.of(context).textTheme.headline5,
              ),
              const ProjectListWidget(),
              const SizedBox(height: 20),
              Text(
                'Tasks',
                style: Theme.of(context).textTheme.headline5,
              ),
              const TaskListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
