import 'package:flutter_test/flutter_test.dart';
import 'package:todoapp/app/projects/data/fake_projects_repository.dart';
import 'package:todoapp/config/initializers/fake_projects.dart';

void main() {
  late FakeProjectsRepository fakeProjectsRepository;
  final fakeProjects = kFakeProjects;

  setUp(() {
    fakeProjectsRepository = FakeProjectsRepository(addDelay: false);
  });

  test('fetchProjectList() should return async list of projects', () async {
    expect(await fakeProjectsRepository.fetchProjectList(), fakeProjects);
  });

  test('getProject(1) should return first project', () async {
    expect(await fakeProjectsRepository.getProject(1), fakeProjects[0]);
  });

  test('getProject(100) should return null', () async {
    expect(await fakeProjectsRepository.getProject(100), null);
  });

  test('watchProjectList should return list of projects', () {
    expect(fakeProjectsRepository.watchProjectList(), emits(fakeProjects));
  });

  test('watchProject(1) should return first project', () {
    expect(fakeProjectsRepository.watchProject(1), emits(fakeProjects[0]));
  });

  test('watchProject(100) should return null', () {
    expect(fakeProjectsRepository.watchProject(100), emits(null));
  });
}
