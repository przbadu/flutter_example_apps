import 'package:todoapp/app/projects/model/project.dart';

abstract class ProjectsRepository {
  Future<Project?> findProject(int id);
  Stream<Project?> watchProject(int id);
  Future<List<Project?>> fetchProjects();
  Stream<List<Project>> watchProjects();
}
