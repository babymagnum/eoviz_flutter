import 'package:dio/dio.dart';

class NewDeviceRequest {
  NewDeviceRequest(this.password, this.username, this.device_id, this.device_brand, this.device_series);

  String username;
  String password;
  String device_id;
  String device_brand;
  String device_series;

  FormData getBody() {
    final form = FormData();

    form.fields
      ..add(MapEntry('username', username))
      ..add(MapEntry('password', password))
      ..add(MapEntry('device_id', device_id))
      ..add(MapEntry('device_brand', device_brand))
      ..add(MapEntry('device_series', device_series));

    return form;
  }
}