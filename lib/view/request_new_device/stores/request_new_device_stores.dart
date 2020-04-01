import 'package:mobx/mobx.dart';

part 'request_new_device_stores.g.dart';

class RequestNewDeviceStores = _RequestNewDeviceStores with _$RequestNewDeviceStores;

abstract class _RequestNewDeviceStores with Store {

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