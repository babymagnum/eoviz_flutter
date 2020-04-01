// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ForgotPasswordStores on _ForgotPasswordStores, Store {
  final _$isLoadingAtom = Atom(name: '_ForgotPasswordStores.isLoading');

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

  final _$newPasswordAtom = Atom(name: '_ForgotPasswordStores.newPassword');

  @override
  String get newPassword {
    _$newPasswordAtom.context.enforceReadPolicy(_$newPasswordAtom);
    _$newPasswordAtom.reportObserved();
    return super.newPassword;
  }

  @override
  set newPassword(String value) {
    _$newPasswordAtom.context.conditionallyRunInAction(() {
      super.newPassword = value;
      _$newPasswordAtom.reportChanged();
    }, _$newPasswordAtom, name: '${_$newPasswordAtom.name}_set');
  }

  final _$confirmPasswordAtom =
      Atom(name: '_ForgotPasswordStores.confirmPassword');

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.context.enforceReadPolicy(_$confirmPasswordAtom);
    _$confirmPasswordAtom.reportObserved();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.context.conditionallyRunInAction(() {
      super.confirmPassword = value;
      _$confirmPasswordAtom.reportChanged();
    }, _$confirmPasswordAtom, name: '${_$confirmPasswordAtom.name}_set');
  }

  final _$_ForgotPasswordStoresActionController =
      ActionController(name: '_ForgotPasswordStores');

  @override
  dynamic changeNewPassword(String value) {
    final _$actionInfo = _$_ForgotPasswordStoresActionController.startAction();
    try {
      return super.changeNewPassword(value);
    } finally {
      _$_ForgotPasswordStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeConfirmPassword(String value) {
    final _$actionInfo = _$_ForgotPasswordStoresActionController.startAction();
    try {
      return super.changeConfirmPassword(value);
    } finally {
      _$_ForgotPasswordStoresActionController.endAction(_$actionInfo);
    }
  }
}
