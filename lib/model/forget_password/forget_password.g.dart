// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_password.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetPassword _$ForgetPasswordFromJson(Map<String, dynamic> json) {
  return ForgetPassword(
      json['status'] as bool,
      (json['messages'] as List)?.map((e) => e as String)?.toList(),
      json['data'] == null
          ? null
          : ForgetPasswordData.fromJson(json['data'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ForgetPasswordToJson(ForgetPassword instance) =>
    <String, dynamic>{
      'status': instance.status,
      'messages': instance.messages,
      'data': instance.data
    };
