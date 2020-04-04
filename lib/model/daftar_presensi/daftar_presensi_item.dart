import 'package:json_annotation/json_annotation.dart';

part 'daftar_presensi_item.g.dart';

@JsonSerializable()
class DaftarPresensiItem {

  DaftarPresensiItem(this.status, this.statusColor, this.date, this.jamKeluar, this.jamKeluarReal, this.jamMasuk, this.jamMasukReal);

  String date;
  String status;
  String statusColor;
  String jamMasuk;
  String jamKeluar;
  String jamMasukReal;
  String jamKeluarReal;

  factory DaftarPresensiItem.fromJson(Map<String, dynamic> json) => _$DaftarPresensiItemFromJson(json);
  Map<String, dynamic> toJson() => _$DaftarPresensiItemToJson(this);
}