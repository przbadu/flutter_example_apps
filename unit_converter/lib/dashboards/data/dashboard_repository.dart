import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_converter/dashboards/dashboards.dart';

class DashboardRepository extends StateNotifier<List<Unit>> {
  DashboardRepository() : super(kUnits);

  /// Returns default list of [Unit] if keyword is empty
  /// Or return the full text search result of the matching [Unit]
  /// based on keyword and [Unit.label]
  void getUnits(String? keyword) {
    if (keyword == null || keyword.isEmpty) {
      state = kUnits;
    } else {
      state = kUnits.where((u) => matchingString(u.label, keyword)).toList();
    }
  }

  /// Returns [Unit] mathing with name
  Unit? findUnit(String name) {
    return kUnits.firstWhere((u) => u.label == name);
  }

  /// helper method to check if [source] contains full text search matching
  /// characters from [keyword]
  bool matchingString(String source, String keyword) {
    return source.toLowerCase().contains(keyword.toLowerCase());
  }
}

final dashboardRepositoryProvider =
    StateNotifierProvider<DashboardRepository, List<Unit>>((ref) {
  return DashboardRepository();
});

final findUnitProvider = StateProvider.family<Unit?, String>((ref, name) {
  return ref.watch(dashboardRepositoryProvider.notifier).findUnit(name);
});
