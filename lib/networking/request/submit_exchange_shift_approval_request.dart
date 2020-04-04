import 'package:dio/dio.dart';

class SubmitExchangeShiftApprovalRequest {
  SubmitExchangeShiftApprovalRequest(this.status_note, this.shift_exchange_id, this.action);

  String action;
  String status_note;
  String shift_exchange_id;

  FormData getBody() {
    final form = FormData();

    form.fields
      ..add(MapEntry('action', action))
      ..add(MapEntry('status_note', status_note))
      ..add(MapEntry('shift_exchange_id', shift_exchange_id));

    return form;
  }
}