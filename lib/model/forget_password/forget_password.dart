import 'package:json_annotation/json_annotation.dart';
import 'forget_password_data.dart';

part 'forget_password.g.dart';

@JsonSerializable()
class ForgetPassword {
  ForgetPassword(this.status, this.messages, this.data);

  bool status;
  List<String> messages = List();
  ForgetPasswordData data;

  factory ForgetPassword.fromJson(Map<String, dynamic> json) => _$ForgetPasswordFromJson(json);
  Map<String, dynamic> toJson() => _$ForgetPasswordToJson(this);
}