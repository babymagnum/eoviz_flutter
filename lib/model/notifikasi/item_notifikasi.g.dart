// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_notifikasi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemNotifikasi _$ItemNotifikasiFromJson(Map<String, dynamic> json) {
  return ItemNotifikasi(json['title'] as String, json['content'] as String,
      json['date'] as String, json['isRead'] as String);
}

Map<String, dynamic> _$ItemNotifikasiToJson(ItemNotifikasi instance) =>
    <String, dynamic>{
      'date': instance.date,
      'title': instance.title,
      'content': instance.content,
      'isRead': instance.isRead
    };
