import 'dart:developer';
import 'package:bakery_shop/screens/pastry_list/pastry_items.dart';
import 'package:flutter/material.dart';
import 'screens/main_screen/main_screen.dart';
import 'screens/menu/menu.dart';
import 'screens/pastry_list/pastry_list.dart';
import 'store/Counter/Counter.dart';
import 'store/RowItem/RowItem.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  Map<int, RowItem> shoppingCart = {};

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bakery Shop',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MainScreen(title: 'Bakery Shop'),
      debugShowCheckedModeBanner: false,
      // initialRoute: '/',
      routes: {
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/menu': (context) => Menu(),
        '/cupcakes': (context) => PastryList(
            PastryItems.cupcakes, Counter(PastryItems.cupcakes), shoppingCart),
      },
    );
  }
}
