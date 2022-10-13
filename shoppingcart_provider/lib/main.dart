import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingcart/models/cart.dart';
import 'package:shoppingcart/screens/cart_screen.dart';
import 'package:shoppingcart/screens/login_screen.dart';
import 'package:shoppingcart/theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Cart()),
        // Provider(create: (context) => ThemeProvider()),
      ],
      child: MaterialApp(
        title: 'Provider Demo',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => const LoginScreen(),
          '/cart': (context) => const CartScreen(),
        },
      ),
    ),
  );
}
