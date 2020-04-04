import 'package:dio/dio.dart';

class UpdateProfileRequest {

  UpdateProfileRequest(this.photo);

  String photo;

  Future<FormData> getBody() async {
    var form = FormData();

    form.files..add(MapEntry('photo', await MultipartFile.fromFile(photo, filename: photo.split('/').last)));

    return form;
  }

}