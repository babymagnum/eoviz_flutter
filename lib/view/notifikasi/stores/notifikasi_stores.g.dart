// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifikasi_stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NotifikasiStores on _NotifikasiStores, Store {
  final _$isLoadingAtom = Atom(name: '_NotifikasiStores.isLoading');

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

  final _$listNotifikasiAtom = Atom(name: '_NotifikasiStores.listNotifikasi');

  @override
  ObservableList<ItemNotifikasi> get listNotifikasi {
    _$listNotifikasiAtom.context.enforceReadPolicy(_$listNotifikasiAtom);
    _$listNotifikasiAtom.reportObserved();
    return super.listNotifikasi;
  }

  @override
  set listNotifikasi(ObservableList<ItemNotifikasi> value) {
    _$listNotifikasiAtom.context.conditionallyRunInAction(() {
      super.listNotifikasi = value;
      _$listNotifikasiAtom.reportChanged();
    }, _$listNotifikasiAtom, name: '${_$listNotifikasiAtom.name}_set');
  }

  final _$_NotifikasiStoresActionController =
      ActionController(name: '_NotifikasiStores');

  @override
  dynamic getNotifikasi() {
    final _$actionInfo = _$_NotifikasiStoresActionController.startAction();
    try {
      return super.getNotifikasi();
    } finally {
      _$_NotifikasiStoresActionController.endAction(_$actionInfo);
    }
  }
}
