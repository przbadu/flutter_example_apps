import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/app/tasks/model/task.dart';
import 'package:todoapp/app/tasks/presentation/tasks_controller.dart';
import 'package:todoapp/helpers/helpers.dart';
import 'package:todoapp/extensions/extensions.dart';

class TaskListWidget extends ConsumerWidget {
  const TaskListWidget({Key? key, required this.tasks}) : super(key: key);

  final List<Task?> tasks;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const subTitleStyle = TextStyle(fontSize: 12);

    return Flexible(
      child: ListView.builder(
        itemCount: tasks.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final task = tasks[index]!;

          return Card(
            child: CheckboxListTile(
              title: Text(task.title),
              subtitle: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (task.date != null && task.time != null)
                    Row(
                      children: [
                        Text(dateFormat(task.date!), style: subTitleStyle),
                        const SizedBox(width: 10),
                        const Icon(Icons.fiber_manual_record, size: 5),
                        const SizedBox(width: 10),
                        Text(task.time!, style: subTitleStyle),
                        const SizedBox(width: 10),
                        const Icon(Icons.fiber_manual_record, size: 5),
                        const SizedBox(width: 10),
                      ],
                    ),
                  Row(
                    children: [
                      const Icon(
                        Icons.folder_outlined,
                        size: 12,
                      ),
                      const SizedBox(width: 5),
                      Text('Uncategorized'.hardcoded, style: subTitleStyle),
                    ],
                  ),
                ],
              ),
              controlAffinity: ListTileControlAffinity.leading,
              value: task.isCompleted,
              onChanged: (isDone) {
                ref
                    .read(tasksControllerProvider.notifier)
                    .toggleTaskCompleted(task.id);
              },
            ),
          );
        },
      ),
    );
  }
}
