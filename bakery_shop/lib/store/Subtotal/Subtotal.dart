import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../RowItem/RowItem.dart';

part 'Subtotal.g.dart';

class Subtotal = _Subtotal with _$Subtotal;

abstract class _Subtotal with Store {
  final List<RowItem> list;

  @observable
  double subtotal = 0;

  _Subtotal(this.list);

  @action
  void sum() {
    double sum = 0;

    for (int i = 0; i < list.length; ++i) {
      double total = list[i].qty * list[i].price;
      sum += total;
    }

    subtotal = sum;
  }
}
