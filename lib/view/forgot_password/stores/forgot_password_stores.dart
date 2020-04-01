import 'package:mobx/mobx.dart';

part 'forgot_password_stores.g.dart';

class ForgotPasswordStores = _ForgotPasswordStores with _$ForgotPasswordStores;

abstract class _ForgotPasswordStores with Store {

  @observable
  bool isLoading = true;

  @observable
  String newPassword = '';

  @observable
  String confirmPassword = '';

  @action
  changeNewPassword(String value) => this.newPassword = value;

  @action
  changeConfirmPassword(String value) => this.confirmPassword = value;
}