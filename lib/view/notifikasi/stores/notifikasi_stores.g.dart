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

  final _$notifikasiPageAtom = Atom(name: '_NotifikasiStores.notifikasiPage');

  @override
  int get notifikasiPage {
    _$notifikasiPageAtom.context.enforceReadPolicy(_$notifikasiPageAtom);
    _$notifikasiPageAtom.reportObserved();
    return super.notifikasiPage;
  }

  @override
  set notifikasiPage(int value) {
    _$notifikasiPageAtom.context.conditionallyRunInAction(() {
      super.notifikasiPage = value;
      _$notifikasiPageAtom.reportChanged();
    }, _$notifikasiPageAtom, name: '${_$notifikasiPageAtom.name}_set');
  }

  final _$notifikasiLastPageAtom =
      Atom(name: '_NotifikasiStores.notifikasiLastPage');

  @override
  int get notifikasiLastPage {
    _$notifikasiLastPageAtom.context
        .enforceReadPolicy(_$notifikasiLastPageAtom);
    _$notifikasiLastPageAtom.reportObserved();
    return super.notifikasiLastPage;
  }

  @override
  set notifikasiLastPage(int value) {
    _$notifikasiLastPageAtom.context.conditionallyRunInAction(() {
      super.notifikasiLastPage = value;
      _$notifikasiLastPageAtom.reportChanged();
    }, _$notifikasiLastPageAtom, name: '${_$notifikasiLastPageAtom.name}_set');
  }

  final _$_NotifikasiStoresActionController =
      ActionController(name: '_NotifikasiStores');

  @override
  dynamic getNotifikasi(bool isFirst) {
    final _$actionInfo = _$_NotifikasiStoresActionController.startAction();
    try {
      return super.getNotifikasi(isFirst);
    } finally {
      _$_NotifikasiStoresActionController.endAction(_$actionInfo);
    }
  }
}
