import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../store/RowItem/RowItem.dart';
import '../../store/Counter/Counter.dart';
import '../cart/cart.dart';
import '../../style.dart';

class PastryList extends StatefulWidget {
  final List<RowItem> myItems;
  final Counter counter;
  final Map<int, RowItem> shoppingCart;

  PastryList(this.myItems, this.counter, this.shoppingCart);

  @override
  _PastryList createState() => _PastryList();
}

class _PastryList extends State<PastryList> {
  bool isZero = true;

  _getChildren(id) {
    return Observer(builder: (_) {
      if (widget.myItems[id].qty == 0) {
        return Row(
          children: [
            Text('${widget.myItems[id].qty}'),
            outlineButton(Icons.add, id),
          ],
        );
      } else {
        return Row(
          children: [
            outlineButton(Icons.remove, id),
            Text('${widget.myItems[id].qty}'),
            outlineButton(Icons.add, id),
          ],
        );
      }
    });
  }

  updateShoppingCart(RowItem row) {
    if (widget.shoppingCart.containsKey(row.id)) {
      if (row.qty == 0)
        widget.shoppingCart.remove(row.id);
      else {
        widget.shoppingCart.update(row.id, (row) => row);
      }
    } else if (row.qty != 0) {
      widget.shoppingCart.putIfAbsent(row.id, () => row);
    }
  }

  Widget pastryTile(int id, String name, int calories, String imagePath) {
    return ListTile(
      leading: Image(
        image: AssetImage(imagePath),
        width: 70,
        height: 70,
      ),
      title: Text(name, style: pastryTileTextStyle()),
      subtitle: Text(calories.toString() + ' calories',
          style: TextStyle(fontSize: 12)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [_getChildren(id)],
      ),
    );
  }

  Widget outlineButton(IconData action, int id) {
    RowItem row = widget.myItems[id];

    if (action == Icons.add) {
      return OutlinedButton(
          onPressed: () {
            row.increment();
            widget.counter.totalQty();
            updateShoppingCart(row);
            setState(() {
              isZero = widget.counter.total == 0 ? true : false;
            });
          },
          child: Icon(action, size: 10),
          style: OutlinedButton.styleFrom(
              shape: CircleBorder(),
              side: BorderSide(width: 1, color: Colors.amber),
              minimumSize: Size(20, 20)));
    }
    return OutlinedButton(
        onPressed: () {
          row.decrement();
          if (row.qty < 0) row.qty = 0;
          widget.counter.totalQty();
          updateShoppingCart(row);
          setState(() {
            isZero = widget.counter.total == 0 ? true : false;
          });
        },
        child: Icon(action, size: 10),
        style: OutlinedButton.styleFrom(
            shape: CircleBorder(),
            side: BorderSide(width: 1, color: Colors.amber),
            minimumSize: Size(20, 20)));
  }

  Widget topDisplay(double _height) {
    String categoryName = ModalRoute.of(context).settings.name;
    String imagePath = 'lib/assets/images' + categoryName + '-logo.png';
    return Container(
      height: _height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image(
              image: AssetImage(imagePath),
              width: 250,
            ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Quantity: ",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Observer(
                  builder: (_) => Text(
                        '${widget.counter.total}',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String categoryName = ModalRoute.of(context).settings.name;
    categoryName = categoryName.substring(1);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(categoryName,
                style: TextStyle(
                    fontFamily: 'Fredoka', color: Colors.white, fontSize: 18))),
        floatingActionButton: Container(
          width: width * 0.9,
          child: FloatingActionButton.extended(
            backgroundColor: isZero ? Color(0xffE0E0E0) : Colors.pink,
            onPressed: () {
              if (!isZero) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cart(
                        shoppingCart: widget.shoppingCart,
                        counter: widget.counter,
                      ),
                    ));
              }
            },
            label: Text("ADD TO CART"),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SingleChildScrollView(
          child: Column(
            children: [
              topDisplay(height * 0.25),
              new Divider(
                thickness: 2.0,
              ),
              ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: widget.myItems.length,
                itemBuilder: (context, index) {
                  return pastryTile(
                      widget.myItems[index].id,
                      widget.myItems[index].name,
                      widget.myItems[index].calories,
                      widget.myItems[index].imagePath);
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
              Container(
                height: height * .15,
              ),
            ],
          ),
        ),
      ),
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
    );
  }
}
