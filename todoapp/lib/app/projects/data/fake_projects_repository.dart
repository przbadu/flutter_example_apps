import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  Future<List<Project?>> fetchProjectList() {
    delay(addDelay);
    return Future.value(_projects);
  }

  @override
  Future<Project?> getProject(int id) {
    delay(addDelay);
    return Future.value(_findProject(_projects, id));
  }

  @override
  Stream<Project?> watchProject(int id) {
    delay(addDelay);
    return watchProjectList().map((projects) => _findProject(projects, id));
  }

  @override
  Stream<List<Project>> watchProjectList() async* {
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

final fakeProjectsRepositoryProvider = Provider<FakeProjectsRepository>((ref) {
  return FakeProjectsRepository();
});

final watchProjectProvider =
    StreamProvider.autoDispose.family<Project?, int>((ref, id) {
  return ref.watch(fakeProjectsRepositoryProvider).watchProject(id);
});

final fetchProjectsListProvider =
    FutureProvider.autoDispose<List<Project?>>((ref) {
  return ref.watch(fakeProjectsRepositoryProvider).fetchProjectList();
});

final watchProjectsListProvider =
    StreamProvider.autoDispose<List<Project?>>((ref) {
  return ref.watch(fakeProjectsRepositoryProvider).watchProjectList();
});
