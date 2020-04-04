import 'package:dio/dio.dart';

class ChangePasswordRequest {
  ChangePasswordRequest(this.new_password, this.old_password, this.retype_new_password);

  String old_password;
  String new_password;
  String retype_new_password;

  FormData getBody() {
    final form = FormData();

    form.fields
      ..add(MapEntry('old_password', old_password))
      ..add(MapEntry('new_password', new_password))
      ..add(MapEntry('retype_new_password', retype_new_password));

    return form;
  }
}