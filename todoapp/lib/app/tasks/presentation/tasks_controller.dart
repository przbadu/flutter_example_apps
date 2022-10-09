import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/app/tasks/data/fake_tasks_repository.dart';
import 'package:todoapp/app/tasks/data/tasks_repository.dart';
import 'package:todoapp/app/tasks/model/task.dart';

class TasksController extends StateNotifier<AsyncValue<void>> {
  TasksController({required this.tasksRepository})
      : super(const AsyncData(null));

  final TasksRepository tasksRepository;

  Future<void> toggleTaskCompleted(Task task) async {
    state = const AsyncLoading();
    state =
        await AsyncValue.guard(() => tasksRepository.toggleTaskCompleted(task));
  }
}

final toggleTaskControllerProvider =
    StateNotifierProvider.autoDispose<TasksController, void>((ref) {
  final tasksRepository = ref.watch(fakeTasksRepositoryProvider);
  return TasksController(tasksRepository: tasksRepository);
});
