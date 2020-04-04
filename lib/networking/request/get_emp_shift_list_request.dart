import 'package:dio/dio.dart';

class GetEmpShiftListRequest {
  GetEmpShiftListRequest(this.exchange_date, this.exchange_type, this.shift_date);

  String exchange_type;
  String shift_date;
  String exchange_date;

  FormData getBody() {
    final form = FormData();

    form.fields
      ..add(MapEntry('exchange_type', exchange_type))
      ..add(MapEntry('shift_date', shift_date))
      ..add(MapEntry('exchange_date', exchange_date))
    ;

    return form;
  }
}