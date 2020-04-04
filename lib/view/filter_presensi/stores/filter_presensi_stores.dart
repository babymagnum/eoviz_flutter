import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/helper/text_util.dart';
import 'package:mobx/mobx.dart';
import '../../splash/stores/splash_stores.dart';

part 'filter_presensi_stores.g.dart';

class FilterPresensiStores = _FilterPresensiStores with _$FilterPresensiStores;

abstract class _FilterPresensiStores with Store {

  @observable
  bool isLoading = true;

  @observable
  String month = '';

  @observable
  int year = 0;

  @observable
  DateTime dateTime = DateTime.now();

  var _splashStores = locator<SplashStores>();

  @action
  changeDateTime(DateTime value) {
    dateTime = value;
    month = TextUtil.getMonth(dateTime.month, _splashStores.preferences);
    year = dateTime.year;
  }

  @action
  getCurrentMonthYear() {
    month = TextUtil.getMonth(DateTime.now().month, _splashStores.preferences);
    year = int.parse(TextUtil.getCurrentDate('yyyy'));
  }
}