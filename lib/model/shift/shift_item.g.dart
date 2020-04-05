// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShiftItem _$ShiftItemFromJson(Map<String, dynamic> json) {
  return ShiftItem(
      json['selected'] as bool,
      json['name'] as String,
      json['dateKeluar'] as String,
      json['dateMasuk'] as String,
      json['shift'] as String,
      json['unit'] as String);
}

Map<String, dynamic> _$ShiftItemToJson(ShiftItem instance) => <String, dynamic>{
      'name': instance.name,
      'unit': instance.unit,
      'shift': instance.shift,
      'dateMasuk': instance.dateMasuk,
      'dateKeluar': instance.dateKeluar,
      'selected': instance.selected
    };
