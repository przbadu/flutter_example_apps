import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/app/projects/data/fake_projects_repository.dart';
import 'package:todoapp/widgets/widgets.dart';

import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:todoapp/app/projects/model/project.dart';

class ProjectListWidget extends ConsumerWidget {
  const ProjectListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectRepository = ref.watch(watchProjectsListProvider);
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 120,
      child: AsyncValueWidget(
        value: projectRepository,
        data: (projects) => ListView.builder(
          itemCount: projects.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final project = projects[index];
            return SizedBox(
              width: screenWidth / 2 - 25,
              child: ProjectRowWidget(
                project: project!,
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProjectRowWidget extends ConsumerWidget {
  const ProjectRowWidget({
    required this.project,
    Key? key,
  }) : super(key: key);

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final widgetWidth = screenWidth / 2 - 10;

    return SizedBox(
      width: widgetWidth,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                '${project.tasksCount} TASKS',
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                project.name,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            const SizedBox(height: 8),
            LinearPercentIndicator(
              percent: project.progress / 100,
              width: widgetWidth - 35,
            ),
          ],
        ),
      ),
    );
  }
}
