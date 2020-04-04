import 'package:json_annotation/json_annotation.dart';
import 'login_data.dart';

part 'login.g.dart';

@JsonSerializable()
class Login {

  Login(this.data, this.messages, this.status);

  bool status;
  List<String> messages = List();
  LoginData data;

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);
  Map<String, dynamic> toJson() => _$LoginToJson(this);
}