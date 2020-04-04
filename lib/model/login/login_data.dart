import 'package:json_annotation/json_annotation.dart';

part 'login_data.g.dart';

@JsonSerializable()
class LoginData {

  LoginData(this.token, this.emp_id, this.emp_lang, this.emp_name, this.photo);

  int emp_id;
  String emp_name;
  String photo;
  String token;
  String emp_lang;

  factory LoginData.fromJson(Map<String, dynamic> json) => _$LoginDataFromJson(json);
  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}