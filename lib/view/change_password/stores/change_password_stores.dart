import 'package:dribbble_clone/core/helper/app_localizations.dart';
import 'package:dribbble_clone/core/helper/common_functions.dart';
import 'package:mobx/mobx.dart';

part 'change_password_stores.g.dart';

class ChangePasswordStores = _ChangePasswordStores with _$ChangePasswordStores;

abstract class _ChangePasswordStores with Store {

  @observable
  bool isLoading = false;

  @observable
  String passwordLama = '';

  @observable
  String passwordBaru = '';

  @observable
  String konfirmasiPasswordBaru = '';

  @action
  changePasswordLama(String value) => this.passwordLama = value;

  @action
  changePasswordBaru(String value) => this.passwordBaru = value;

  @action
  changeKonfirmasiPasswordBaru(String value) => this.konfirmasiPasswordBaru = value;

  @action
  changePassword(context) {
    if (passwordLama == '') {
      CommonFunctions.showCupertinoDialogUnderstand(context, null, buildTranslate(context, 'old_password_is_empty'), buildTranslate(context, 'understand'));
    } else if (passwordBaru == '') {
      CommonFunctions.showCupertinoDialogUnderstand(context, null, buildTranslate(context, 'new_password_is_empty'), buildTranslate(context, 'understand'));
    } else if (konfirmasiPasswordBaru == '') {
      CommonFunctions.showCupertinoDialogUnderstand(context, null, buildTranslate(context, 'confirm_new_password_is_empty'), buildTranslate(context, 'understand'));
    } else if (konfirmasiPasswordBaru != passwordBaru) {
      CommonFunctions.showCupertinoDialogUnderstand(context, null, buildTranslate(context, 'new_password_not_match'), buildTranslate(context, 'understand'));
    } else {
      isLoading = true;

      Future.delayed(Duration(seconds: 1), () {
        isLoading = false;
      });
    }
  }
}