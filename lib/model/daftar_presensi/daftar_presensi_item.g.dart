// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daftar_presensi_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DaftarPresensiItem _$DaftarPresensiItemFromJson(Map<String, dynamic> json) {
  return DaftarPresensiItem(
      json['status'] as String,
      json['statusColor'] as String,
      json['date'] as String,
      json['jamKeluar'] as String,
      json['jamKeluarReal'] as String,
      json['jamMasuk'] as String,
      json['jamMasukReal'] as String);
}

Map<String, dynamic> _$DaftarPresensiItemToJson(DaftarPresensiItem instance) =>
    <String, dynamic>{
      'date': instance.date,
      'status': instance.status,
      'statusColor': instance.statusColor,
      'jamMasuk': instance.jamMasuk,
      'jamKeluar': instance.jamKeluar,
      'jamMasukReal': instance.jamMasukReal,
      'jamKeluarReal': instance.jamKeluarReal
    };
