import 'package:todoapp/app/projects/model/project.dart';

abstract class ProjectsRepository {
  Future<Project?> getProject(int id);
  Stream<Project?> watchProject(int id);
  Future<List<Project?>> fetchProjectList();
  Stream<List<Project>> watchProjectList();
}
