import 'package:bakery_shop/store/Subtotal/Subtotal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../store/RowItem/RowItem.dart';
import '../../store/Counter/Counter.dart';
import '../../style.dart';

class Cart extends StatefulWidget {
  final Map<int, RowItem> shoppingCart;
  final Counter counter;

  Cart({Key key, @required this.shoppingCart, @required this.counter})
      : super(key: key);

  @override
  _Cart createState() => _Cart();
}

class _Cart extends State<Cart> {
  Widget qtyButtons(
      RowItem row, Map<int, RowItem> shoppingCart, Subtotal subtotal) {
    return Row(children: [
      OutlinedButton(
          onPressed: () {
            row.decrement();
            if (row.qty < 0) row.qty = 0;
            updateShoppingCart(row, shoppingCart, subtotal);
          },
          child: Icon(Icons.remove, size: 10),
          style: OutlinedButton.styleFrom(
              shape: CircleBorder(),
              side: BorderSide(width: 1, color: Colors.amber),
              minimumSize: Size(20, 20))),
      Observer(builder: (_) => Text('${row.qty.toString()}')),
      OutlinedButton(
          onPressed: () {
            row.increment();
            updateShoppingCart(row, shoppingCart, subtotal);
          },
          child: Icon(Icons.add, size: 10),
          style: OutlinedButton.styleFrom(
              shape: CircleBorder(),
              side: BorderSide(width: 1, color: Colors.amber),
              minimumSize: Size(20, 20))),
      GestureDetector(
        onTap: () {
          setState(() {
            row.qty = 0;
            widget.counter.totalQty();
            shoppingCart.remove(row.id);
          });
        },
        child: Text("remove", style: TextStyle(fontSize: 12)),
      ),
    ]);
  }

  Widget itemTile(RowItem row, String imagePath, Map<int, RowItem> shoppingCart,
      Subtotal subtotal) {
    return ListTile(
      leading: Image(
        image: AssetImage(imagePath),
        width: 70,
        height: 70,
      ),
      title: qtyButtons(row, shoppingCart, subtotal),
      subtitle: Text(row.name, style: cartItemTextStyle()),
      trailing: Text(row.price.toStringAsFixed(2)),
    );
  }

  updateShoppingCart(
      RowItem row, Map<int, RowItem> shoppingCart, Subtotal subtotal) {
    RowItem rowInCart;

    if (shoppingCart.containsKey(row.id)) {
      if (row.qty == 0)
        shoppingCart.remove(row.id);
      else {
        rowInCart = shoppingCart[row.id];
        rowInCart.qty = row.qty;
        shoppingCart.update(row.id, (rowInCart) => rowInCart);
      }
    } else if (row.qty != 0) {
      rowInCart =
          new RowItem(row.id, row.name, row.calories, row.price, row.imagePath);
      rowInCart.qty = row.qty;
      shoppingCart.putIfAbsent(row.id, () => rowInCart);
    }

    subtotal.sum();
  }

  Widget build(BuildContext context) {
    var list = widget.shoppingCart.values.toList();
    final Subtotal subtotal = new Subtotal(list);
    subtotal.sum();

    for (RowItem row in list) {
      print(row.id);
    }
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Review Order",
              style: TextStyle(
                  fontFamily: 'Fredoka', color: Colors.white, fontSize: 18)),
          actions: [
            Container(
              alignment: Alignment.topRight,
              child: CloseButton(
                color: Colors.black38,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return itemTile(list[index], list[index].imagePath,
                      widget.shoppingCart, subtotal);
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    thickness: 2.0,
                  );
                },
              ),
              Divider(
                thickness: 2.0,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Observer(
                    builder: (_) => Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(
                            "Subtotal: \$" +
                                '${subtotal.subtotal.toStringAsFixed(2)}',
                            style: TextStyle(fontWeight: FontWeight.bold)))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
