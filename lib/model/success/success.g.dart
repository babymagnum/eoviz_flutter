// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'success.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Success _$SuccessFromJson(Map<String, dynamic> json) {
  return Success(json['status'] as bool,
      (json['message'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$SuccessToJson(Success instance) =>
    <String, dynamic>{'status': instance.status, 'message': instance.message};
