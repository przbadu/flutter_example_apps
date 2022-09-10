import 'package:flutter/material.dart';

class WalletsListScreen extends StatelessWidget {
  const WalletsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wallets')),
      body: const Center(
        child: Text('Wallets list screen'),
      ),
    );
  }
}
