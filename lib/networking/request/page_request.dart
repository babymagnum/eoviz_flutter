import 'package:dio/dio.dart';

class PageRequest {
  PageRequest(this.page);

  String page;

  FormData getBody() {
    final form = FormData();

    form.fields
      ..add(MapEntry('page', page));

    return form;
  }
}