import 'package:flutter/material.dart';

class TransactionsListScreen extends StatelessWidget {
  const TransactionsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transactions')),
      body: const Center(
        child: Text('Transactions list screen'),
      ),
    );
  }
}
