import 'package:dribbble_clone/core/helper/app_localizations.dart';
import 'package:dribbble_clone/core/helper/common_functions.dart';
import 'package:dribbble_clone/view/home/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'login_stores.g.dart';

class LoginStores = _LoginStores with _$LoginStores;

abstract class _LoginStores with Store {

  @observable
  bool isLoading = false;

  @observable
  String email = '';

  @observable
  String password = '';

  @action
  changeEmail(String email) => this.email = email;

  @action
  changePassword(String password) => this.password = password;

  @action
  login(context) {
    if (email == '') {
      CommonFunctions.showCupertinoDialogUnderstand(context, null, buildTranslate(context, 'email_is_empty'), buildTranslate(context, 'understand'));
    } else if (password == '') {
      CommonFunctions.showCupertinoDialogUnderstand(context, null, buildTranslate(context, 'password_is_empty'), buildTranslate(context, 'understand'));
    } else {
      isLoading = true;

      Future.delayed(Duration(seconds: 2), () {
        isLoading = false;

        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomeView()));
      });
    }
  }
}