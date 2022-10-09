import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/app/tasks/data/fake_tasks_repository.dart';
import 'package:todoapp/app/tasks/data/tasks_repository.dart';
import 'package:todoapp/app/tasks/model/task.dart';
import 'package:todoapp/config/initializers/fake_tasks.dart';

class TasksController extends StateNotifier<AsyncValue<List<Task?>>> {
  TasksController({required this.tasksRepository})
      : super(AsyncData(kFakeTasks));

  final TasksRepository tasksRepository;

  Future<void> fetchTaskList() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => tasksRepository.fetchTaskList());
  }

  Future<void> toggleTaskCompleted(int id) async {
    state.when(
      data: (tasks) async => state = await AsyncValue.guard(
        () async => [
          for (final task in tasks)
            if (task != null && task.id == id)
              task.copyWith(isCompleted: !task.isCompleted)
            else
              task,
        ],
      ),
      error: (e, s) => state = AsyncError(e, s),
      loading: () => state = const AsyncLoading(),
    );
  }
}

final tasksControllerProvider =
    StateNotifierProvider.autoDispose<TasksController, AsyncValue<List<Task?>>>(
        (ref) {
  final tasksRepository = ref.watch(fakeTasksRepositoryProvider);

  return TasksController(tasksRepository: tasksRepository);
});
