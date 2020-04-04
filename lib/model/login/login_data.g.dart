// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginData _$LoginDataFromJson(Map<String, dynamic> json) {
  return LoginData(
      json['token'] as String,
      json['emp_id'] as int,
      json['emp_lang'] as String,
      json['emp_name'] as String,
      json['photo'] as String);
}

Map<String, dynamic> _$LoginDataToJson(LoginData instance) => <String, dynamic>{
      'emp_id': instance.emp_id,
      'emp_name': instance.emp_name,
      'photo': instance.photo,
      'token': instance.token,
      'emp_lang': instance.emp_lang
    };
