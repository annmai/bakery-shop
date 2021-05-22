// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Counter.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Counter on _Counter, Store {
  final _$totalAtom = Atom(name: '_Counter.total');

  @override
  int get total {
    _$totalAtom.reportRead();
    return super.total;
  }

  @override
  set total(int value) {
    _$totalAtom.reportWrite(value, super.total, () {
      super.total = value;
    });
  }

  final _$_CounterActionController = ActionController(name: '_Counter');

  @override
  void totalQty() {
    final _$actionInfo =
        _$_CounterActionController.startAction(name: '_Counter.totalQty');
    try {
      return super.totalQty();
    } finally {
      _$_CounterActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
total: ${total}
    ''';
  }
}
