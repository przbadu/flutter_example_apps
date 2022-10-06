import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/app/tasks/data/fake_tasks_repository.dart';
import 'package:todoapp/widgets/widgets.dart';

class TaskListWidget extends ConsumerWidget {
  const TaskListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasksRepository = ref.watch(watchTasksListProvider);

    return Flexible(
      child: AsyncValueWidget(
        value: tasksRepository,
        data: (tasks) => ListView.builder(
          itemCount: tasks.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final task = tasks[index];

            return Card(
              child: CheckboxListTile(
                title: Text(task!.title),
                subtitle: Text(task.createdAt.toString()),
                controlAffinity: ListTileControlAffinity.leading,
                value: task.isCompleted,
                onChanged: (isDone) {
                  print(isDone);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
