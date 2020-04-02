// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beranda_stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BerandaStores on _BerandaStores, Store {
  final _$currentTimeAtom = Atom(name: '_BerandaStores.currentTime');

  @override
  String get currentTime {
    _$currentTimeAtom.context.enforceReadPolicy(_$currentTimeAtom);
    _$currentTimeAtom.reportObserved();
    return super.currentTime;
  }

  @override
  set currentTime(String value) {
    _$currentTimeAtom.context.conditionallyRunInAction(() {
      super.currentTime = value;
      _$currentTimeAtom.reportChanged();
    }, _$currentTimeAtom, name: '${_$currentTimeAtom.name}_set');
  }

  final _$_BerandaStoresActionController =
      ActionController(name: '_BerandaStores');

  @override
  dynamic startTimerAndSetView() {
    final _$actionInfo = _$_BerandaStoresActionController.startAction();
    try {
      return super.startTimerAndSetView();
    } finally {
      _$_BerandaStoresActionController.endAction(_$actionInfo);
    }
  }
}
