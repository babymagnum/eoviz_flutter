import 'dart:async';
import 'package:dribbble_clone/core/helper/text_util.dart';
import 'package:mobx/mobx.dart';

part 'beranda_stores.g.dart';

class BerandaStores = _BerandaStores with _$BerandaStores;

abstract class _BerandaStores with Store {

  int _seconds = 0;
  int _minutes = 0;
  int _hours = 0;

  @observable
  String currentTime = '';

  Timer _timer;

  @action
  startTimerAndSetView() {
    if (_timer != null) _timer.cancel();

    var timeArray = TextUtil.getCurrentDate('HH:mm:ss').split(':');
    _hours = int.parse(timeArray[0]);
    _minutes = int.parse(timeArray[1]);
    _seconds = int.parse(timeArray[2]);

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {

      if (currentTime.length >= 12 && currentTime.substring(0, 5) != TextUtil.getCurrentDate('HH:mm')) startTimerAndSetView();

      _seconds += 1;

      if (_seconds == 60) {
        _seconds = 0;
        _minutes += 1;
      }

      if (_minutes == 60) {
        _minutes = 0;
        _hours += 1;
      }

      if (_hours == 24) {
        _hours = 0;
      }

      currentTime = '${_hours.toString().length == 1 ? '0$_hours' : _hours}:${_minutes.toString().length == 1 ? '0$_minutes' : _minutes}:${_seconds.toString().length == 1 ? '0$_seconds' : _seconds} WIB';
    });
  }

}