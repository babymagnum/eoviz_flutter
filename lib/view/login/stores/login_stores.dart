import 'package:mobx/mobx.dart';

part 'login_stores.g.dart';

class LoginStores = _LoginStores with _$LoginStores;

abstract class _LoginStores with Store {

  @observable
  bool isLoading = true;

  @observable
  String email = '';

  @observable
  String password = '';

  @action
  changeEmail(String email) => this.email = email;

  @action
  changePassword(String password) => this.password = password;
}