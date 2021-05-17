import 'package:flutter/material.dart';
import 'appbar.dart';
import 'hamburger_menu.dart';
import 'promos.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: hamburgerMenu(context),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(175),
          child: appBar("The Bakery Shop")),
      body: Center(
        child: promos(),
      ),
    );
  }
}
