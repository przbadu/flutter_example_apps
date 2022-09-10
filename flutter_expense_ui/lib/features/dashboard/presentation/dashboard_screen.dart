import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Column(children: const [
        Text('Available Balance'),
        SizedBox(height: 20),
        Text(
            "Wallets horizontal scrollable with their balance, number of transactions"),
        SizedBox(height: 20),
        Text("Top Categories"),
        SizedBox(height: 20),
      ]),
    );
  }
}
