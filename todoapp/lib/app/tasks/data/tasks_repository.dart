import 'package:todoapp/app/tasks/model/task.dart';

abstract class TasksRepository {
  Future<Task?> getTask(int id);
  Future<List<Task?>> fetchTaskList();
  Stream<List<Task>> watchTaskList();
  Stream<Task?> watchTask(int id);
}
