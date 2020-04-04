import 'package:dio/dio.dart';

class SubmitVerifCodeForgetPasswordRequest {
  SubmitVerifCodeForgetPasswordRequest(this.email, this.code);

  String email;
  String code;

  FormData getBody() {
    final form = FormData();

    form.fields
      ..add(MapEntry('email', email))
      ..add(MapEntry('code', code));

    return form;
  }
}