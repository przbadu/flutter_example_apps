import 'package:todoapp/app/tasks/model/task.dart';

abstract class TasksRepository {
  Future<Task?> findTask(int id);
  Future<List<Task?>> fetchTasks();
  Stream<List<Task>> watchTasks();
  Stream<Task?> watchTask(int id);
}
