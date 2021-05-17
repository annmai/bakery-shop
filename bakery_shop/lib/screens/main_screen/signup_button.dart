import 'package:flutter/material.dart';

Widget signupButton() {
  return Container(
      width: 200,
      padding: EdgeInsets.all(5),
      child: TextButton(
          child: Text("Sign Up".toUpperCase(), style: TextStyle(fontSize: 12)),
          style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(3)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.pinkAccent)))),
          onPressed: () => null));
}
