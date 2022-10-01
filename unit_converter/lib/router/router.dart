import 'package:go_router/go_router.dart';
import 'package:unit_converter/dashboards/dashboards.dart';
import 'package:unit_converter/date_converter/date_converter.dart';
import 'package:unit_converter/router/not_found_screen.dart';

enum AppRouteState {
  home,
  dashboard,
  dateConverter,
  currencyConverter,
}

final appRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      name: AppRouteState.home.name,
      path: '/',
      builder: (context, state) => const DashboardPage(),
      routes: [
        GoRoute(
          name: AppRouteState.dateConverter.name,
          path: 'date_converter',
          // pageBuilder: (context, state) {
          //   return MaterialPage(
          //     key: state.pageKey,
          //     fullscreenDialog: true,
          //     child: const DateConverter(),
          //   );
          // },
          builder: (context, state) => const DateConverterView(),
        ),
        GoRoute(
          name: AppRouteState.currencyConverter.name,
          path: 'currency_converter',
          builder: (context, state) => const DateConverterView(),
        )
      ],
    ),
  ],
  errorBuilder: (context, state) => const NotFoundScreen(),
);
