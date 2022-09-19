import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_converter/dashboards/dashboards.dart';

class DashboardRepository {
  List<Unit> getUnits(String? keyword) {
    if (keyword == null) {
      return kUnits;
    } else {
      return kUnits.where((element) => element.label == keyword).toList();
    }
  }

  Unit findUnit(String name) {
    return kUnits.firstWhere((u) => u.label == name);
  }
}

final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  return DashboardRepository();
});

final getUnitsProvider =
    StateProvider.family<List<Unit>, String?>((ref, keyword) {
  return ref.watch(dashboardRepositoryProvider).getUnits(keyword);
});

final findUnitProvider = StateProvider.family<Unit, String>((ref, name) {
  return ref.watch(dashboardRepositoryProvider).findUnit(name);
});
