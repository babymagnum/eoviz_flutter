import 'package:dio/dio.dart';

class SubmitCutiRequest {
  SubmitCutiRequest(this.send_type, this.reason, this.date_end, this.date_start, this.dates, this.permission_id,
    this.perstype_id);

  String perstype_id;
  String reason;
  String date_start;
  String date_end;
  List<String> dates;
  String send_type;
  String permission_id;

  FormData getBody() {
    final form = FormData();

    form.fields
      ..add(MapEntry('perstype_id', perstype_id))
      ..add(MapEntry('reason', reason))
      ..add(MapEntry('date_start', date_start))
      ..add(MapEntry('date_end', date_end))
      ..add(MapEntry('send_type', send_type));

    for (int i=0; i<dates.length; i++) {
      form.fields..add(MapEntry('dates[$i]', dates[i]));
    }

    return form;
  }
}