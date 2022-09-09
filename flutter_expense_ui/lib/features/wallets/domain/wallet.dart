import 'package:flutter/cupertino.dart';

class Wallet {
  Wallet({
    required this.id,
    required this.name,
    this.color,
  });

  final String id;
  final String name;
  final Color? color;
}
