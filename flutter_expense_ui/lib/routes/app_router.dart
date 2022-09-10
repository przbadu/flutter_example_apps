import 'package:flutter_ui/features/features.dart';
import 'package:flutter_ui/features/settings/settings.dart';
import 'package:go_router/go_router.dart';

enum AppRoutes {
  home,
  dashboard,
  categories,
  wallets,
  transactions,
  setting,
}

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      name: AppRoutes.home.name,
      builder: (context, state) => const HomeScreen(),
      // nested routes
      routes: [
        GoRoute(
          path: 'dashboard',
          name: AppRoutes.dashboard.name,
          builder: (context, state) => const CategoriesListScreen(),
          // nest all categories route here.
          // routes: [],
        ),
        GoRoute(
          path: 'categories',
          name: AppRoutes.categories.name,
          builder: (context, state) => const CategoriesListScreen(),
          // nest all categories route here.
          // routes: [],
        ),
        GoRoute(
          path: 'transactions',
          name: AppRoutes.transactions.name,
          builder: (context, state) => const TransactionsListScreen(),
          // nest all transactions route here.
          // routes: [],
        ),
        GoRoute(
          path: 'wallets',
          name: AppRoutes.wallets.name,
          builder: (context, state) => const WalletsListScreen(),
          // nest all wallets route here.
          // routes: [],
        ),
        GoRoute(
          path: 'setting',
          name: AppRoutes.setting.name,
          builder: (context, state) => const SettingScreen(),
          // nest all settings route here.
          // routes: [],
        ),
      ],
    )
  ],
);
