import '../../view/login/stores/login_stores.dart';
import '../../view/forgot_password/stores/forgot_password_stores.dart';
import '../../view/forgot_password_email/stores/forgot_password_email_stores.dart';
import '../../view/forgot_password_pin/stores/forgot_password_pin_stores.dart';
import '../../view/request_new_device/stores/request_new_device_stores.dart';
import '../../view/beranda/stores/beranda_stores.dart';
import '../../view/notifikasi/stores/notifikasi_stores.dart';
import '../../view/profil/stores/profil_stores.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.I;

void setupLocator() {

  /*
  * Use registerFactory if you need to instantiate it everytime its need
  * locator.registerFactory<LoginProvider>(() => LoginProvider());
  *
  * =================================================================
  *
  * Use registerSingleton if you dont need to instantiate it everytime
  * locator.registerSingleton(() => LoginProvider());
  * */

  locator.registerLazySingleton<LoginStores>(() => LoginStores());
  locator.registerLazySingleton<ForgotPasswordStores>(() => ForgotPasswordStores());
  locator.registerLazySingleton<ForgotPasswordEmailStores>(() => ForgotPasswordEmailStores());
  locator.registerLazySingleton<ForgotPasswordPinStores>(() => ForgotPasswordPinStores());
  locator.registerLazySingleton<RequestNewDeviceStores>(() => RequestNewDeviceStores());
  locator.registerLazySingleton<BerandaStores>(() => BerandaStores());
  locator.registerLazySingleton<NotifikasiStores>(() => NotifikasiStores());
  locator.registerLazySingleton<ProfilStores>(() => ProfilStores());
}
