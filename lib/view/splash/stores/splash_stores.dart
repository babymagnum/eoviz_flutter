import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splash_stores.g.dart';

class SplashStores = _SplashStores with _$SplashStores;

abstract class _SplashStores with Store {

  @observable
  SharedPreferences preferences;

  @action
  initSharedPreference() async {
    preferences = await SharedPreferences.getInstance();
  }

}