import 'package:mobx/mobx.dart';

part 'RowItem.g.dart';

class RowItem = _RowItem with _$RowItem;

abstract class _RowItem with Store {
  final int id;
  final String name;
  final int calories;

  _RowItem(this.id, this.name, this.calories);

  @observable
  int qty = 0;

  @action
  void increment() {
    ++qty;
  }

  @action
  void decrement() {
    --qty;
  }
}
