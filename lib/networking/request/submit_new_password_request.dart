import 'package:dio/dio.dart';

class SubmitNewPasswordRequest {
  SubmitNewPasswordRequest(this.email, this.new_password, this.code);

  String email;
  String new_password;
  String code;

  FormData getBody() {
    final form = FormData();

    form.fields
      ..add(MapEntry('email', email))
      ..add(MapEntry('new_password', new_password))
      ..add(MapEntry('code', code));

    return form;
  }
}