import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';
import 'screens/main_screen/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bakery Shop',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MainScreen(title: 'Bakery Shop'),
      debugShowCheckedModeBanner: false,
    );
  }
}
