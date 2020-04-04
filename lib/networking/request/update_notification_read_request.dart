import 'package:dio/dio.dart';

class UpdateNotificationReadRequest {
  UpdateNotificationReadRequest(this.notification_id);

  String notification_id;

  FormData getBody() {
    final form = FormData();

    form.fields
      ..add(MapEntry('notification_id', notification_id));

    return form;
  }
}