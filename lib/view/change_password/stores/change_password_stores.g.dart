// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChangePasswordStores on _ChangePasswordStores, Store {
  final _$isLoadingAtom = Atom(name: '_ChangePasswordStores.isLoading');

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

  final _$passwordLamaAtom = Atom(name: '_ChangePasswordStores.passwordLama');

  @override
  String get passwordLama {
    _$passwordLamaAtom.context.enforceReadPolicy(_$passwordLamaAtom);
    _$passwordLamaAtom.reportObserved();
    return super.passwordLama;
  }

  @override
  set passwordLama(String value) {
    _$passwordLamaAtom.context.conditionallyRunInAction(() {
      super.passwordLama = value;
      _$passwordLamaAtom.reportChanged();
    }, _$passwordLamaAtom, name: '${_$passwordLamaAtom.name}_set');
  }

  final _$passwordBaruAtom = Atom(name: '_ChangePasswordStores.passwordBaru');

  @override
  String get passwordBaru {
    _$passwordBaruAtom.context.enforceReadPolicy(_$passwordBaruAtom);
    _$passwordBaruAtom.reportObserved();
    return super.passwordBaru;
  }

  @override
  set passwordBaru(String value) {
    _$passwordBaruAtom.context.conditionallyRunInAction(() {
      super.passwordBaru = value;
      _$passwordBaruAtom.reportChanged();
    }, _$passwordBaruAtom, name: '${_$passwordBaruAtom.name}_set');
  }

  final _$konfirmasiPasswordBaruAtom =
      Atom(name: '_ChangePasswordStores.konfirmasiPasswordBaru');

  @override
  String get konfirmasiPasswordBaru {
    _$konfirmasiPasswordBaruAtom.context
        .enforceReadPolicy(_$konfirmasiPasswordBaruAtom);
    _$konfirmasiPasswordBaruAtom.reportObserved();
    return super.konfirmasiPasswordBaru;
  }

  @override
  set konfirmasiPasswordBaru(String value) {
    _$konfirmasiPasswordBaruAtom.context.conditionallyRunInAction(() {
      super.konfirmasiPasswordBaru = value;
      _$konfirmasiPasswordBaruAtom.reportChanged();
    }, _$konfirmasiPasswordBaruAtom,
        name: '${_$konfirmasiPasswordBaruAtom.name}_set');
  }

  final _$_ChangePasswordStoresActionController =
      ActionController(name: '_ChangePasswordStores');

  @override
  dynamic changePasswordLama(String value) {
    final _$actionInfo = _$_ChangePasswordStoresActionController.startAction();
    try {
      return super.changePasswordLama(value);
    } finally {
      _$_ChangePasswordStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePasswordBaru(String value) {
    final _$actionInfo = _$_ChangePasswordStoresActionController.startAction();
    try {
      return super.changePasswordBaru(value);
    } finally {
      _$_ChangePasswordStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeKonfirmasiPasswordBaru(String value) {
    final _$actionInfo = _$_ChangePasswordStoresActionController.startAction();
    try {
      return super.changeKonfirmasiPasswordBaru(value);
    } finally {
      _$_ChangePasswordStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePassword(dynamic context) {
    final _$actionInfo = _$_ChangePasswordStoresActionController.startAction();
    try {
      return super.changePassword(context);
    } finally {
      _$_ChangePasswordStoresActionController.endAction(_$actionInfo);
    }
  }
}
