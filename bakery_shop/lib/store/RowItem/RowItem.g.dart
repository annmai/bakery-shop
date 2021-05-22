// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RowItem.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RowItem on _RowItem, Store {
  final _$qtyAtom = Atom(name: '_RowItem.qty');

  @override
  int get qty {
    _$qtyAtom.reportRead();
    return super.qty;
  }

  @override
  set qty(int value) {
    _$qtyAtom.reportWrite(value, super.qty, () {
      super.qty = value;
    });
  }

  final _$_RowItemActionController = ActionController(name: '_RowItem');

  @override
  void increment() {
    final _$actionInfo =
        _$_RowItemActionController.startAction(name: '_RowItem.increment');
    try {
      return super.increment();
    } finally {
      _$_RowItemActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo =
        _$_RowItemActionController.startAction(name: '_RowItem.decrement');
    try {
      return super.decrement();
    } finally {
      _$_RowItemActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
qty: ${qty}
    ''';
  }
}
