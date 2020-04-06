import 'package:json_annotation/json_annotation.dart';

part 'tukar_shift_item.g.dart';

@JsonSerializable()
class TukarShiftItem {

  TukarShiftItem(this.isRead, this.content, this.image, this.date);

  String date;
  String image;
  String content;
  bool isRead;

  factory TukarShiftItem.fromJson(Map<String, dynamic> json) => _$TukarShiftItemFromJson(json);
  Map<String, dynamic> toJson() => _$TukarShiftItemToJson(this);
}