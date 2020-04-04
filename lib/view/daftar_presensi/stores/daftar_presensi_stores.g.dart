// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daftar_presensi_stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DaftarPresensiStores on _DaftarPresensiStores, Store {
  final _$isLoadingAtom = Atom(name: '_DaftarPresensiStores.isLoading');

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

  final _$listPresensiAtom = Atom(name: '_DaftarPresensiStores.listPresensi');

  @override
  ObservableList<DaftarPresensiItem> get listPresensi {
    _$listPresensiAtom.context.enforceReadPolicy(_$listPresensiAtom);
    _$listPresensiAtom.reportObserved();
    return super.listPresensi;
  }

  @override
  set listPresensi(ObservableList<DaftarPresensiItem> value) {
    _$listPresensiAtom.context.conditionallyRunInAction(() {
      super.listPresensi = value;
      _$listPresensiAtom.reportChanged();
    }, _$listPresensiAtom, name: '${_$listPresensiAtom.name}_set');
  }

  final _$_DaftarPresensiStoresActionController =
      ActionController(name: '_DaftarPresensiStores');

  @override
  dynamic getListPresensi() {
    final _$actionInfo = _$_DaftarPresensiStoresActionController.startAction();
    try {
      return super.getListPresensi();
    } finally {
      _$_DaftarPresensiStoresActionController.endAction(_$actionInfo);
    }
  }
}
