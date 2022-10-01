import 'package:todoapp/app/projects/data/projects_repository.dart';
import 'package:todoapp/app/projects/model/project.dart';
import 'package:todoapp/config/initializers/fake_projects.dart';
import 'package:todoapp/helpers/helpers.dart';

class FakeProjectsRepository implements ProjectsRepository {
  final _projects = kFakeProjects;
  final bool addDelay;
  FakeProjectsRepository({
    this.addDelay = true,
  });

  @override
  Future<List<Project?>> fetchProjects() {
    delay(addDelay);
    return Future.value(_projects);
  }

  @override
  Future<Project?> findProject(int id) {
    delay(addDelay);
    return Future.value(_findProject(_projects, id));
  }

  @override
  Stream<Project?> watchProject(int id) {
    delay(addDelay);
    return watchProjects().map((projects) => _findProject(projects, id));
  }

  @override
  Stream<List<Project>> watchProjects() async* {
    delay(addDelay);
    yield _projects;
  }

  static Project? _findProject(List<Project> projects, int id) {
    try {
      return projects.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }
}
