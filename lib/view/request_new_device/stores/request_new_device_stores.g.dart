// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_new_device_stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RequestNewDeviceStores on _RequestNewDeviceStores, Store {
  final _$isLoadingAtom = Atom(name: '_RequestNewDeviceStores.isLoading');

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

  final _$emailAtom = Atom(name: '_RequestNewDeviceStores.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$passwordAtom = Atom(name: '_RequestNewDeviceStores.password');

  @override
  String get password {
    _$passwordAtom.context.enforceReadPolicy(_$passwordAtom);
    _$passwordAtom.reportObserved();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.context.conditionallyRunInAction(() {
      super.password = value;
      _$passwordAtom.reportChanged();
    }, _$passwordAtom, name: '${_$passwordAtom.name}_set');
  }

  final _$_RequestNewDeviceStoresActionController =
      ActionController(name: '_RequestNewDeviceStores');

  @override
  dynamic changeEmail(String email) {
    final _$actionInfo =
        _$_RequestNewDeviceStoresActionController.startAction();
    try {
      return super.changeEmail(email);
    } finally {
      _$_RequestNewDeviceStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePassword(String password) {
    final _$actionInfo =
        _$_RequestNewDeviceStoresActionController.startAction();
    try {
      return super.changePassword(password);
    } finally {
      _$_RequestNewDeviceStoresActionController.endAction(_$actionInfo);
    }
  }
}
