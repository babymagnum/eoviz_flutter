// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profil_stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfilStores on _ProfilStores, Store {
  final _$fileAtom = Atom(name: '_ProfilStores.file');

  @override
  File get file {
    _$fileAtom.context.enforceReadPolicy(_$fileAtom);
    _$fileAtom.reportObserved();
    return super.file;
  }

  @override
  set file(File value) {
    _$fileAtom.context.conditionallyRunInAction(() {
      super.file = value;
      _$fileAtom.reportChanged();
    }, _$fileAtom, name: '${_$fileAtom.name}_set');
  }

  final _$isShowCameraAtom = Atom(name: '_ProfilStores.isShowCamera');

  @override
  bool get isShowCamera {
    _$isShowCameraAtom.context.enforceReadPolicy(_$isShowCameraAtom);
    _$isShowCameraAtom.reportObserved();
    return super.isShowCamera;
  }

  @override
  set isShowCamera(bool value) {
    _$isShowCameraAtom.context.conditionallyRunInAction(() {
      super.isShowCamera = value;
      _$isShowCameraAtom.reportChanged();
    }, _$isShowCameraAtom, name: '${_$isShowCameraAtom.name}_set');
  }

  final _$_ProfilStoresActionController =
      ActionController(name: '_ProfilStores');

  @override
  dynamic changeFile(File file) {
    final _$actionInfo = _$_ProfilStoresActionController.startAction();
    try {
      return super.changeFile(file);
    } finally {
      _$_ProfilStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeShowCamera(bool value) {
    final _$actionInfo = _$_ProfilStoresActionController.startAction();
    try {
      return super.changeShowCamera(value);
    } finally {
      _$_ProfilStoresActionController.endAction(_$actionInfo);
    }
  }
}
