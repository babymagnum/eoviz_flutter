// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_presensi_stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FilterPresensiStores on _FilterPresensiStores, Store {
  final _$isLoadingAtom = Atom(name: '_FilterPresensiStores.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

  final _$monthAtom = Atom(name: '_FilterPresensiStores.month');

  @override
  String get month {
    _$monthAtom.context.enforceReadPolicy(_$monthAtom);
    _$monthAtom.reportObserved();
    return super.month;
  }

  @override
  set month(String value) {
    _$monthAtom.context.conditionallyRunInAction(() {
      super.month = value;
      _$monthAtom.reportChanged();
    }, _$monthAtom, name: '${_$monthAtom.name}_set');
  }

  final _$yearAtom = Atom(name: '_FilterPresensiStores.year');

  @override
  int get year {
    _$yearAtom.context.enforceReadPolicy(_$yearAtom);
    _$yearAtom.reportObserved();
    return super.year;
  }

  @override
  set year(int value) {
    _$yearAtom.context.conditionallyRunInAction(() {
      super.year = value;
      _$yearAtom.reportChanged();
    }, _$yearAtom, name: '${_$yearAtom.name}_set');
  }

  final _$dateTimeAtom = Atom(name: '_FilterPresensiStores.dateTime');

  @override
  DateTime get dateTime {
    _$dateTimeAtom.context.enforceReadPolicy(_$dateTimeAtom);
    _$dateTimeAtom.reportObserved();
    return super.dateTime;
  }

  @override
  set dateTime(DateTime value) {
    _$dateTimeAtom.context.conditionallyRunInAction(() {
      super.dateTime = value;
      _$dateTimeAtom.reportChanged();
    }, _$dateTimeAtom, name: '${_$dateTimeAtom.name}_set');
  }

  final _$_FilterPresensiStoresActionController =
      ActionController(name: '_FilterPresensiStores');

  @override
  dynamic changeDateTime(DateTime value) {
    final _$actionInfo = _$_FilterPresensiStoresActionController.startAction();
    try {
      return super.changeDateTime(value);
    } finally {
      _$_FilterPresensiStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getCurrentMonthYear() {
    final _$actionInfo = _$_FilterPresensiStoresActionController.startAction();
    try {
      return super.getCurrentMonthYear();
    } finally {
      _$_FilterPresensiStoresActionController.endAction(_$actionInfo);
    }
  }
}
