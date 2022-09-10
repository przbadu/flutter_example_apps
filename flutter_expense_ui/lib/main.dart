import 'package:flutter/material.dart';
import 'package:flutter_ui/routes/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: goRouter.routeInformationParser,
      routerDelegate: goRouter.routerDelegate,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.greenAccent,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
    );
  }
}
