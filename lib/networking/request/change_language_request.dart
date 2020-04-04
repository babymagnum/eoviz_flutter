import 'package:dio/dio.dart';

class ChangeLanguageRequest {
  ChangeLanguageRequest(this.emp_lang);

  String emp_lang;

  FormData getBody() {
    final form = FormData();

    form.fields
      ..add(MapEntry('emp_lang', emp_lang));

    return form;
  }
}