import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:todoapp/config/config.dart';
import 'package:todoapp/extensions/extensions.dart';

void main() async {
  /// For more info on error handling, see:
  /// https://docs.flutter.dev/testing/errors
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    /// turn off the # in the URLs on the web
    GoRouter.setUrlPathStrategy(UrlPathStrategy.path);

    /// Entry point of the app
    runApp(const ProviderScope(child: MyApp()));

    /// This code will present some error UI if any uncaught exception happens
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
    };

    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Scaffold(
        appBar: AppBar(
          title: Text('An error occurred'.hardcoded),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Text(details.toString()),
          ),
        ),
      );
    };
  }, (Object error, StackTrace stack) {
    /// Log any errors to console
    debugPrint(error.toString());
  });
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: appRoutes.routeInformationParser,
      routerDelegate: appRoutes.routerDelegate,
      routeInformationProvider: appRoutes.routeInformationProvider,
      restorationScopeId: 'app',
      onGenerateTitle: (BuildContext context) => 'Todo App'.hardcoded,
      theme: kLightTheme,
      darkTheme: kDarkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
