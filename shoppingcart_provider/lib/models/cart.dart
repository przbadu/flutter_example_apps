import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:shoppingcart/models/item.dart';

class Cart extends ChangeNotifier {
  // Internal private state of carts
  final List<Item> _items = [];

  // An unmodifiable list of items in the cart
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  // calculate total price with fake price times items length
  int get totalPrice => _items.length * 42;

  /// Adds [Item] to cart
  void add(Item item) {
    _items.add(item);
    // notify listeners
    notifyListeners();
  }

  // remove all items from the cart
  void removeAll() {
    _items.clear();
    notifyListeners();
  }
}
