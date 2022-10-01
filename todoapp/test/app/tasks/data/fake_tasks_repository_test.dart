import 'package:flutter_test/flutter_test.dart';
import 'package:todoapp/app/tasks/data/fake_tasks_repository.dart';
import 'package:todoapp/config/initializers/fake_tasks.dart';

void main() {
  late FakeTaskRepository fakeTasksRepository;
  final fakeTasks = kFakeTasks;

  setUp(() {
    fakeTasksRepository = FakeTaskRepository(addDelay: false);
  });

  test('fetchTaskList() should return async list of projects', () async {
    expect(await fakeTasksRepository.fetchTaskList(), fakeTasks);
  });

  test('getTask(1) should return first project', () async {
    expect(await fakeTasksRepository.getTask(1), fakeTasks[0]);
  });

  test('getTask(100) should return null', () async {
    expect(await fakeTasksRepository.getTask(100), null);
  });

  test('watchTaskList should return list of projects', () {
    expect(fakeTasksRepository.watchTaskList(), emits(fakeTasks));
  });

  test('watchTask(1) should return first project', () {
    expect(fakeTasksRepository.watchTask(1), emits(fakeTasks[0]));
  });

  test('watchTask(100) should return null', () {
    expect(fakeTasksRepository.watchTask(100), emits(null));
  });
}
