import 'package:dio/dio.dart';

class PresenceRequest {
  PresenceRequest(this.latitude, this.longitude, this.presence_type, this.preszone_id);

  String latitude;
  String longitude;
  String preszone_id;
  String presence_type;

  FormData getBody() {
    final form = FormData();

    form.fields
      ..add(MapEntry('latitude', latitude))
      ..add(MapEntry('longitude', longitude))
      ..add(MapEntry('preszone_id', preszone_id))
      ..add(MapEntry('presence_type', presence_type))
    ;

    return form;
  }
}