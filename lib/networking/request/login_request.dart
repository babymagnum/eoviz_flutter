import 'package:dio/dio.dart';

class LoginRequest {
  LoginRequest(this.device_series, this.device_brand, this.device_id, this.fcm, this.username, this.password);

  String username;
  String password;
  String fcm;
  String device_id;
  String device_brand;
  String device_series;

  FormData getBody() {
    final form = FormData();

    form.fields
      ..add(MapEntry('username', username))
      ..add(MapEntry('password', password))
      ..add(MapEntry('fcm', fcm))
      ..add(MapEntry('device_id', device_id))
      ..add(MapEntry('device_brand', device_brand))
      ..add(MapEntry('device_series', device_series));

    return form;
  }
}