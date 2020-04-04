// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Home _$HomeFromJson(Map<String, dynamic> json) {
  return Home(
      json['data'] == null
          ? null
          : HomeData.fromJson(json['data'] as Map<String, dynamic>),
      (json['messages'] as List)?.map((e) => e as String)?.toList(),
      json['status'] as bool);
}

Map<String, dynamic> _$HomeToJson(Home instance) => <String, dynamic>{
      'status': instance.status,
      'messages': instance.messages,
      'data': instance.data
    };
