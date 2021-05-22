import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../RowItem/RowItem.dart';

part 'Counter.g.dart';

class Counter = _Counter with _$Counter;

abstract class _Counter with Store {
  final List<RowItem> catalog;

  @observable
  int total = 0;

  _Counter(this.catalog);

  @action
  void totalQty() {
    int sum = 0;

    for (int i = 0; i < catalog.length; ++i) {
      sum += catalog[i].qty;
    }

    total = sum;
  }
}
