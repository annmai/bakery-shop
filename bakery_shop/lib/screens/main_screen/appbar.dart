import 'package:flutter/material.dart';

Widget appBar(String title) {
  return AppBar(
    bottom: PreferredSize(
        preferredSize: const Size.fromHeight(5.0),
        child: Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 35.0),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontFamily: 'Vacaciones',
                      color: Colors.white,
                      fontSize: 35),
                ),
                Text(
                  'Join our Perks program to enjoy freebies, special offers, and more.',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ],
            ))),
  );
}
