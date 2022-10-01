import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/extensions/extensions.dart';

class TasksByProjectPage extends ConsumerWidget {
  const TasksByProjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Text(
          'Task By Category Page'.hardcoded,
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
