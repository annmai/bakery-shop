import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../store/RowItem/RowItem.dart';
import '../../store/Counter/Counter.dart';

class PastryList extends StatefulWidget {
  final List<RowItem> myItems;
  final Counter counter;

  PastryList(this.myItems, this.counter);

  @override
  _PastryList createState() => _PastryList();
}

class _PastryList extends State<PastryList> {
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

  Widget pastryTile(int id, String name, int calories, String imagePath) {
    return ListTile(
      leading: Image(
        image: AssetImage(imagePath),
        width: 70,
        height: 70,
      ),
      title: Text(name, style: TextStyle(fontSize: 15)),
      subtitle: Text(calories.toString(), style: TextStyle(fontSize: 12)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [_getChildren(id)],
      ),
    );
  }

  Widget outlineButton(IconData action, int id) {
    RowItem row = widget.myItems[id]; // change variable to cupcake

    if (action == Icons.add) {
      return OutlinedButton(
          onPressed: () {
            row.increment();
            widget.counter.totalQty();
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
        },
        child: Icon(action, size: 10),
        style: OutlinedButton.styleFrom(
            shape: CircleBorder(),
            side: BorderSide(width: 1, color: Colors.amber),
            minimumSize: Size(20, 20)));
  }

  Widget topDisplay(double _height) {
    return Container(
      height: _height,
      child: Row(
        children: [
          Observer(builder: (_) => Text('${widget.counter.total}')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("A fancier app"),
        ),
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
                      'lib/assets/images/cupcake-1.jpg');
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    thickness: 2.0,
                  );
                },
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
