import 'package:dio/dio.dart';

class ForgetPasswordRequest {
  ForgetPasswordRequest(this.email);

  String email;

  FormData getBody() {
    final form = FormData();

    form.fields
      ..add(MapEntry('email', email));

    return form;
  }
}