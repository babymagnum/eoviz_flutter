import 'package:json_annotation/json_annotation.dart';

part 'item_notifikasi.g.dart';

@JsonSerializable()
class ItemNotifikasi {

  ItemNotifikasi(this.title, this.content, this.date, this.isRead);

  String date;
  String title;
  String content;
  String isRead;

  factory ItemNotifikasi.fromJson(Map<String, dynamic> json) => _$ItemNotifikasiFromJson(json);
  Map<String, dynamic> toJson() => _$ItemNotifikasiToJson(this);
}