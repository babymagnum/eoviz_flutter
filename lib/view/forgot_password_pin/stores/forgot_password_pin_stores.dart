import 'dart:async';

import 'package:mobx/mobx.dart';

part 'forgot_password_pin_stores.g.dart';

class ForgotPasswordPinStores = _ForgotPasswordPinStores with _$ForgotPasswordPinStores;

abstract class _ForgotPasswordPinStores with Store {

  @observable
  bool isLoading = true;

  @observable
  String input1 = '';

  @observable
  String input2 = '';

  @observable
  String input3 = '';

  @observable
  String input4 = '';

  @observable
  int minutes = 1;

  @observable
  int seconds = 59;

  @action
  changeInput1(String value) => this.input1 = value;

  @action
  changeInput2(String value) => this.input2 = value;

  @action
  changeInput3(String value) => this.input3 = value;

  @action
  changeInput4(String value) => this.input4 = value;

  Timer _timer;

  @action
  startTimer() {
    if (_timer != null) _timer.cancel();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      seconds -= 1;

      if (seconds == 0) {
        seconds = 59;
        minutes -= 1;
      }

      if (minutes < 0) {
        timer.cancel();
        seconds = 0;
        minutes = 0;
      }
    });
  }

  @action
  resetTimer() {
    seconds = 59;
    minutes = 1;
  }
}