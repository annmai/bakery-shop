import '../../store/RowItem/RowItem.dart';

class PastryItems {
  static final List<RowItem> cupcakes = [
    RowItem(0, "Chocolate Strawberry", 800, 4.50,
        'lib/assets/images/cupcake-0.jpg'),
    RowItem(1, "Red Velvet", 500, 5.50, 'lib/assets/images/cupcake-1.jpg'),
    RowItem(2, "Mint Cholocate", 625, 5.25, 'lib/assets/images/cupcake-2.jpg'),
    RowItem(
        3, "Vanilla Strawberry", 350, 4.25, 'lib/assets/images/cupcake-3.jpg'),
    RowItem(
        4, "Double Chocolate", 430, 4.75, 'lib/assets/images/cupcake-4.jpg'),
    RowItem(
        5, "Vanilla Raspberry", 240, 5.50, 'lib/assets/images/cupcake-5.jpg'),
    RowItem(6, "Vanilla Cream", 305, 4.00, 'lib/assets/images/cupcake-6.jpg'),
    RowItem(
        7, "Strawberry Frosted", 295, 4.50, 'lib/assets/images/cupcake-7.jpg'),
    RowItem(
        8, "Chocolate Blueberry", 300, 5.50, 'lib/assets/images/cupcake-8.jpg'),
    RowItem(
        9, "Classic Lemon Cream", 320, 4.50, 'lib/assets/images/cupcake-9.jpg'),
  ];

  static List<RowItem> get(type) => type;
}
