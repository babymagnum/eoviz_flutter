import 'package:dio/dio.dart';

class CancelCutiRequest {
  CancelCutiRequest(this.permission_id, this.status_note);

  String status_note;
  String permission_id;

  FormData getBody() {
    final form = FormData();

    form.fields
      ..add(MapEntry('status_note', status_note))
      ..add(MapEntry('permission_id', permission_id));

    return form;
  }
}