// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SplashStores on _SplashStores, Store {
  final _$preferencesAtom = Atom(name: '_SplashStores.preferences');

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

  final _$initSharedPreferenceAsyncAction = AsyncAction('initSharedPreference');

  @override
  Future initSharedPreference() {
    return _$initSharedPreferenceAsyncAction
        .run(() => super.initSharedPreference());
  }
}
