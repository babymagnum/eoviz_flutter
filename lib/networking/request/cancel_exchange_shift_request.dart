import 'package:dio/dio.dart';

class CancelExchangeShiftRequest {
  CancelExchangeShiftRequest(this.shift_exchange_id, this.cancel_note);

  String shift_exchange_id;
  String cancel_note;

  FormData getBody() {
    final form = FormData();

    form.fields
      ..add(MapEntry('shift_exchange_id', shift_exchange_id))
      ..add(MapEntry('cancel_note', cancel_note));

    return form;
  }
}