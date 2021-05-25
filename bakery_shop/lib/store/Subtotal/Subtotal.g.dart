// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Subtotal.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Subtotal on _Subtotal, Store {
  final _$subtotalAtom = Atom(name: '_Subtotal.subtotal');

  @override
  double get subtotal {
    _$subtotalAtom.reportRead();
    return super.subtotal;
  }

  @override
  set subtotal(double value) {
    _$subtotalAtom.reportWrite(value, super.subtotal, () {
      super.subtotal = value;
    });
  }

  final _$_SubtotalActionController = ActionController(name: '_Subtotal');

  @override
  void sum() {
    final _$actionInfo =
        _$_SubtotalActionController.startAction(name: '_Subtotal.sum');
    try {
      return super.sum();
    } finally {
      _$_SubtotalActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
subtotal: ${subtotal}
    ''';
  }
}
