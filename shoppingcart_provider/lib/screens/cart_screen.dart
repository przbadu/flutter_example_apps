import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingcart/models/cart.dart';
import 'package:shoppingcart/models/item.dart';

final kItems = [
  'apple',
  'orange',
  'banana',
  'pineapple',
  'sugarcan',
];

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: Column(
        children: const [
          _CartTotal(),
          Divider(height: 4, color: Colors.white),
          _EmptyCart(),
          Expanded(
            child: _CartList(),
          ),
        ],
      ),
    );
  }
}

class _EmptyCart extends StatelessWidget {
  const _EmptyCart();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Empty Cart'),
      onPressed: () {
        context.read<Cart>().removeAll();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Cart is now empty!'),
          ),
        );
      },
    );
  }
}

class _CartList extends StatelessWidget {
  const _CartList();

  @override
  Widget build(BuildContext context) {
    final itemNameStyle = Theme.of(context).textTheme.titleLarge;

    // This gets the current state of CartModel and also tells Flutter
    // to rebuild this widget when CartModel notifies listeners (in other words,
    // when it changes).
    var cart = context.watch<Cart>();

    return ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(cart.items[index].name, style: itemNameStyle),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal();

  @override
  Widget build(BuildContext context) {
    final hugeStyle =
        Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 48);
    final cart = context.read<Cart>();

    print('triggered');

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<Cart>(
              builder: (context, cart, child) => Text(
                'Total: \$${cart.totalPrice}',
                style: hugeStyle,
              ),
            ),
            const SizedBox(width: 24),
            ElevatedButton(
              onPressed: () {
                final random = Random();
                final itemName = kItems[random.nextInt(kItems.length)];
                cart.add(Item(itemName));
              },
              child: const Text('BUY'),
            ),
          ],
        ),
      ),
    );
  }
}
