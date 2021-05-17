import 'package:flutter/material.dart';
import 'signup_button.dart';

Widget hamburgerMenu(BuildContext context) {
  return Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical
    // space to fit everything.
    child: Container(
      color: Color(0xffE5E5E5),
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
              height: 300,
              child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0xffE0E0E0),
                  ),
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topRight,
                        child: CloseButton(color: Colors.black38),
                      ),
                      Image(
                        image:
                            AssetImage('lib/assets/images/StrawberryCake.png'),
                        width: 100,
                        height: 100,
                      ),
                      signupButton(),
                      Text.rich(
                        TextSpan(
                          text: 'Already registered? ',
                          style: TextStyle(
                              height: 2, fontSize: 12, color: Colors.black87),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'sign in',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                )),
                          ],
                        ),
                      )
                    ],
                  ))),
          Padding(padding: EdgeInsets.only(top: 20)),
          listItem("Menu", context),
          listItem("Locations", context),
          listItem("Offers", context),
          listItem("Settings", context),
          footerItem("Customer Service", context),
          footerItem("Legal", context)
        ],
      ),
    ),
  );
}

Widget listItem(String name, BuildContext context) {
  return ListTile(
    contentPadding: EdgeInsets.fromLTRB(50, 0, 0, 0),
    dense: true,
    visualDensity: VisualDensity(horizontal: 0, vertical: -3),
    title: Text(
      name,
      style:
          TextStyle(fontFamily: 'Fredoka', color: Colors.black, fontSize: 18),
    ),
    onTap: () {
      // Update the state of the app
      // ...
      // Then close the drawer
      Navigator.pop(context);
    },
  );
}

Widget footerItem(String name, BuildContext context) {
  return ListTile(
    contentPadding: EdgeInsets.fromLTRB(50, 0, 0, 0),
    dense: true,
    visualDensity: VisualDensity(horizontal: 0, vertical: -3),
    title: Text(
      name,
      style: TextStyle(color: Colors.black, fontSize: 14),
    ),
    onTap: () {
      // Update the state of the app
      // ...
      // Then close the drawer
      Navigator.pop(context);
    },
  );
}
