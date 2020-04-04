import 'package:dio/dio.dart';

class PageRequest {
  PageRequest(this.shift_date, this.exchange_type, this.exchange_emp_id, this.exchange_shift_date, this.exchange_shift_id,
    this.reason, this.send_type, this.shift_exchange_id, this.shift_id);

  String shift_id;
  String exchange_type;
  String reason;
  String shift_date;
  String exchange_shift_date;
  String exchange_shift_id;
  String exchange_emp_id;
  String send_type;
  String shift_exchange_id;

  FormData getBody() {
    final form = FormData();

    form.fields
      ..add(MapEntry('shift_id', shift_id))
      ..add(MapEntry('exchange_type', exchange_type))
      ..add(MapEntry('reason', reason))
      ..add(MapEntry('shift_date', shift_date))
      ..add(MapEntry('exchange_shift_date', exchange_shift_date))
      ..add(MapEntry('exchange_shift_id', exchange_shift_id))
      ..add(MapEntry('exchange_emp_id', exchange_emp_id))
      ..add(MapEntry('send_type', send_type))
      ..add(MapEntry('shift_exchange_id', shift_exchange_id));

    return form;
  }
}