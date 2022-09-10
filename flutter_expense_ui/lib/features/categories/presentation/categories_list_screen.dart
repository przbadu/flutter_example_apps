import 'package:flutter/material.dart';

class CategoriesListScreen extends StatelessWidget {
  const CategoriesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: const Center(
        child: Text('Categories list screen'),
      ),
    );
  }
}
