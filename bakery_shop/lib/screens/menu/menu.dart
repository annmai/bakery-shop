import 'package:bakery_shop/style.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _Menu createState() => _Menu();
}

class _Menu extends State<Menu> {
  var _menuItems = <Widget>[];
  final GlobalKey<AnimatedListState> _menuKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _loadMenuItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('menu',
            style: TextStyle(
                fontFamily: 'Fredoka', color: Colors.white, fontSize: 18)),
      ),
      body: AnimatedList(
        key: _menuKey,
        padding: EdgeInsets.only(top: 10),
        initialItemCount: _menuItems.length,
        itemBuilder: (context, index, animation) {
          return SlideTransition(
              position: CurvedAnimation(
                curve: Curves.easeOut,
                parent: animation,
              ).drive((Tween<Offset>(
                begin: Offset(0, 1),
                end: Offset(0, 0),
              ))),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(color: Theme.of(context).dividerColor)),
                ),
                child: _menuItems[index],
              ));
        },
      ),
    );
  }

  void _loadMenuItems() {
    final menuList = [
      menuTile('Cupcakes', 'lib/assets/images/cupcake-1.jpg', '/cupcakes'),
      menuTile('Cake', 'lib/assets/images/StrawberryCake.png', '/cake'),
      menuTile(
          'Cookies', 'lib/assets/images/chocolate-chip-cookie.png', '/cookies'),
      menuTile('Donuts', 'lib/assets/images/strawberry-sprinkles-donut.png',
          '/donuts')
    ];

    var future = Future(() {});

    for (int i = 0; i < menuList.length; ++i) {
      future = future.then((_) {
        return Future.delayed(Duration(milliseconds: 250), () {
          _menuItems.add(menuList[i]);
          _menuKey.currentState.insertItem(_menuItems.length - 1);
        });
      });
    }
  }

  Widget menuTile(String title, String imagePath, String route) {
    return ListTile(
      leading: Padding(
        padding: EdgeInsets.all(6),
        child: Image(
          image: AssetImage(imagePath),
          width: 80,
          height: 80,
        ),
      ),
      title: Text(
        title,
        style: menuTextStyle(),
      ),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}
