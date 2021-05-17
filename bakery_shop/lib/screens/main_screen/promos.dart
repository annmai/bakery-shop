import 'package:flutter/material.dart';

Widget promos() {
  return ListView(
    children: [
      promoCard(
          350.0,
          'lib/assets/images/double-trouble.png',
          200.0,
          200.0,
          'Happy Sweet Tooth Day',
          'Treat yourself to our made-from-scratch cupcakes. They are baked fresh daily and stocked to satisfy those late night cravings.'),
      SizedBox(height: 5),
      promoCard(
          270.0,
          'lib/assets/images/macarons.png',
          300.0,
          100.0,
          'New Flavors',
          'Choose from a variety of flavors including almond, strawberry, birthday cake (new), carrot cake (new), salted caramel, cookies & cream, mint chocolate (new), cholocate, and more!')
    ],
  );
}

Widget promoCard(double cardHeight, String imagePath, double width,
    double height, String title, String description) {
  return Container(
    height: cardHeight,
    child: Card(
        elevation: 5,
        child: Column(
          children: [
            Image(
              image: AssetImage(imagePath),
              width: width,
              height: height,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      child: Text(title,
                          style: TextStyle(fontWeight: FontWeight.bold)))),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Text(description, style: TextStyle(height: 1.5))),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      child: Text('Order Now',
                          style: TextStyle(
                              color: Colors.pink,
                              fontWeight: FontWeight.bold)))),
            ),
          ],
        )),
  );
}
