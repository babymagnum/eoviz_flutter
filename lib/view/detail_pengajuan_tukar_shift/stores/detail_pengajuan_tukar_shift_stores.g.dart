// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_pengajuan_tukar_shift_stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailPengajuanTukarShiftStores
    on _DetailPengajuanTukarShiftStores, Store {
  final _$preferencesAtom =
      Atom(name: '_DetailPengajuanTukarShiftStores.preferences');

  @override
  SharedPreferences get preferences {
    _$preferencesAtom.context.enforceReadPolicy(_$preferencesAtom);
    _$preferencesAtom.reportObserved();
    return super.preferences;
  }

  @override
  set preferences(SharedPreferences value) {
    _$preferencesAtom.context.conditionallyRunInAction(() {
      super.preferences = value;
      _$preferencesAtom.reportChanged();
    }, _$preferencesAtom, name: '${_$preferencesAtom.name}_set');
  }

  final _$contentSizeAtom =
      Atom(name: '_DetailPengajuanTukarShiftStores.contentSize');

  @override
  double get contentSize {
    _$contentSizeAtom.context.enforceReadPolicy(_$contentSizeAtom);
    _$contentSizeAtom.reportObserved();
    return super.contentSize;
  }

  @override
  set contentSize(double value) {
    _$contentSizeAtom.context.conditionallyRunInAction(() {
      super.contentSize = value;
      _$contentSizeAtom.reportChanged();
    }, _$contentSizeAtom, name: '${_$contentSizeAtom.name}_set');
  }

  final _$alasanPembatalanAtom =
      Atom(name: '_DetailPengajuanTukarShiftStores.alasanPembatalan');

  @override
  String get alasanPembatalan {
    _$alasanPembatalanAtom.context.enforceReadPolicy(_$alasanPembatalanAtom);
    _$alasanPembatalanAtom.reportObserved();
    return super.alasanPembatalan;
  }

  @override
  set alasanPembatalan(String value) {
    _$alasanPembatalanAtom.context.conditionallyRunInAction(() {
      super.alasanPembatalan = value;
      _$alasanPembatalanAtom.reportChanged();
    }, _$alasanPembatalanAtom, name: '${_$alasanPembatalanAtom.name}_set');
  }

  final _$_DetailPengajuanTukarShiftStoresActionController =
      ActionController(name: '_DetailPengajuanTukarShiftStores');

  @override
  dynamic changeAlasanPembatalan(String value) {
    final _$actionInfo =
        _$_DetailPengajuanTukarShiftStoresActionController.startAction();
    try {
      return super.changeAlasanPembatalan(value);
    } finally {
      _$_DetailPengajuanTukarShiftStoresActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeContentSize(double value) {
    final _$actionInfo =
        _$_DetailPengajuanTukarShiftStoresActionController.startAction();
    try {
      return super.changeContentSize(value);
    } finally {
      _$_DetailPengajuanTukarShiftStoresActionController
          .endAction(_$actionInfo);
    }
  }
}
