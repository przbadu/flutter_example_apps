import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_converter/dashboards/data/dashboard_repository.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    /// TODO: find how to apply filter on the provider
    final units = ref.watch(dashboardRepositoryProvider);

    print('units $units');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.transparent : Colors.white,
        elevation: 0,
        title: TextField(
          controller: searchController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Search for units',
            suffixIcon: Icon(Icons.search),
          ),
          onChanged: (value) =>
              ref.read(dashboardRepositoryProvider.notifier).getUnits(value),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemCount: units.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) {
            final dashboardItem = units[index];

            return Card(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(dashboardItem.icon, color: dashboardItem.color),
                    Text(dashboardItem.label),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
