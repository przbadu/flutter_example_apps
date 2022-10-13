import 'package:flutter_test/flutter_test.dart';
import 'package:shoppingcart/models/cart.dart';
import 'package:shoppingcart/models/item.dart';

void main() {
  testWidgets('adding item increases total cost', (tester) async {
    final cart = Cart();
    final startingPrice = cart.totalPrice;
    cart.addListener(() {
      expect(cart.totalPrice, greaterThan(startingPrice));
    });
    cart.add(Item('Test'));
  });
}
