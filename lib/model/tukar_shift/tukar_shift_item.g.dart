// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tukar_shift_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TukarShiftItem _$TukarShiftItemFromJson(Map<String, dynamic> json) {
  return TukarShiftItem(json['isRead'] as bool, json['content'] as String,
      json['image'] as String, json['date'] as String);
}

Map<String, dynamic> _$TukarShiftItemToJson(TukarShiftItem instance) =>
    <String, dynamic>{
      'date': instance.date,
      'image': instance.image,
      'content': instance.content,
      'isRead': instance.isRead
    };
