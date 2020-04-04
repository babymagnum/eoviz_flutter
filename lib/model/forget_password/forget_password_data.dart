import 'package:json_annotation/json_annotation.dart';

part 'forget_password_data.g.dart';

@JsonSerializable()
class ForgetPasswordData {
  ForgetPasswordData(this.expired_token);

  int expired_token;

  factory ForgetPasswordData.fromJson(Map<String, dynamic> json) => _$ForgetPasswordDataFromJson(json);
  Map<String, dynamic> toJson() => _$ForgetPasswordDataToJson(this);
}