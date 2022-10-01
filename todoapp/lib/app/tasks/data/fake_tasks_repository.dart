import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/app/tasks/data/tasks_repository.dart';
import 'package:todoapp/app/tasks/model/task.dart';
import 'package:todoapp/config/initializers/fake_tasks.dart';
import 'package:todoapp/helpers/helpers.dart';

class FakeTaskRepository implements TasksRepository {
  final _tasks = kFakeTasks;
  final bool addDelay;
  FakeTaskRepository({
    this.addDelay = true,
  });

  @override
  Future<List<Task?>> fetchTaskList() {
    delay(addDelay);
    return Future.value(_tasks);
  }

  @override
  Future<Task?> getTask(int id) {
    delay(addDelay);
    return Future.value(_findTask(_tasks, id));
  }

  @override
  Stream<Task?> watchTask(int id) {
    delay(addDelay);
    return watchTaskList().map((tasks) => _findTask(tasks, id));
  }

  @override
  Stream<List<Task>> watchTaskList() async* {
    delay(addDelay);
    yield _tasks;
  }

  Task? _findTask(List<Task> tasks, int id) {
    try {
      return tasks.firstWhere((t) => t.id == id);
    } catch (e) {
      return null;
    }
  }
}

final fakeTasksRepositoryProvider = Provider<FakeTaskRepository>((ref) {
  return FakeTaskRepository();
});

final watchTaskProvider =
    StreamProvider.autoDispose.family<Task?, int>((ref, id) {
  return ref.watch(fakeTasksRepositoryProvider).watchTask(id);
});

final fetchTasksListProvider = FutureProvider.autoDispose<List<Task?>>((ref) {
  return ref.watch(fakeTasksRepositoryProvider).fetchTaskList();
});

final watchTasksListProvider = StreamProvider.autoDispose<List<Task?>>((ref) {
  return ref.watch(fakeTasksRepositoryProvider).watchTaskList();
});
