import 'package:mobx/mobx.dart';

part 'forgot_password_email_stores.g.dart';

class ForgotPasswordEmailStores = _ForgotPasswordEmailStores with _$ForgotPasswordEmailStores;

abstract class _ForgotPasswordEmailStores with Store {

  @observable
  bool isLoading = true;

  @observable
  String email = '';

  @observable
  String password = '';

  @action
  changeEmail(String email) => this.email = email;

}