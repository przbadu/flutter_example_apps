import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui/constants/test_categories.dart';
import 'package:flutter_ui/features/categories/categories.dart';

class FakeCategoriesRepository {
  final _categories = kTestCategories;

  List<Category> getCategoriesList() {
    return _categories;
  }

  Category? getCategory(String id) {
    return _categories.firstWhere((t) => t.id == id);
  }

  Future<List<Category>> fetchCategoriesList() async {
    Future.delayed(const Duration(milliseconds: 400));
    return Future.value(_categories);
  }

  Stream<List<Category>> watchCategoriesList() async* {
    Future.delayed(const Duration(milliseconds: 400));
    yield _categories;
  }

  Stream<Category?> watchCategory(String id) {
    return watchCategoriesList()
        .map((categories) => categories.firstWhere((t) => t.id == id));
  }
}

/// setup riverpod providers

/// Provider for transactions repository class
final categoriesRepositoryProvider = Provider<FakeCategoriesRepository>((ref) {
  return FakeCategoriesRepository();
});

final categoriesListsStreamProvider =
    StreamProvider.autoDispose<List<Category>>((ref) {
  final categoriesRepository = ref.watch(categoriesRepositoryProvider);
  return categoriesRepository.watchCategoriesList();
});

final categoriesListsFutureProvider =
    FutureProvider.autoDispose<List<Category>>((ref) {
  final categoriesRepository = ref.watch(categoriesRepositoryProvider);
  return categoriesRepository.fetchCategoriesList();
});

final categoriesStreamProvider =
    StreamProvider.autoDispose.family<Category?, String>((ref, id) {
  final categoriesRepository = ref.watch(categoriesRepositoryProvider);
  return categoriesRepository.watchCategory(id);
});
