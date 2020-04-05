import 'package:json_annotation/json_annotation.dart';

part 'shift_item.g.dart';

@JsonSerializable()
class ShiftItem {

  ShiftItem(this.selected, this.name, this.dateKeluar, this.dateMasuk, this.shift, this.unit);

  String name;
  String unit;
  String shift;
  String dateMasuk;
  String dateKeluar;
  bool selected;

  factory ShiftItem.fromJson(Map<String, dynamic> json) => _$ShiftItemFromJson(json);
  Map<String, dynamic> toJson() => _$ShiftItemToJson(this);
}