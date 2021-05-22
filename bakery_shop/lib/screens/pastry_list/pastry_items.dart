import '../../store/RowItem/RowItem.dart';

class PastryItems {
  static final List<RowItem> cupcakes = [
    RowItem(0, "Chocolate Strawberry", 800),
    RowItem(1, "Chocolate Strawberry", 500),
    RowItem(2, "Chocolate Frosting", 500),
    RowItem(3, "Chocolate Strawberry", 350),
    RowItem(4, "Chocolate Strawberry", 300),
    RowItem(5, "Chocolate Strawberry", 240),
    RowItem(6, "Chocolate Strawberry", 305),
    RowItem(7, "Chocolate Strawberry", 295),
    RowItem(8, "Chocolate Strawberry", 300),
    RowItem(9, "Chocolate Strawberry", 320),
  ];

  static List<RowItem> get(type) => type;
}
