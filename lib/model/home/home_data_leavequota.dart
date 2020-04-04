import 'package:json_annotation/json_annotation.dart';

part 'home_data_leavequota.g.dart';

@JsonSerializable()
class HomeDataLeaveQuota {

  HomeDataLeaveQuota(this.quota, this.used);

  int quota;
  int used;

  factory HomeDataLeaveQuota.fromJson(Map<String, dynamic> json) => _$HomeDataLeaveQuotaFromJson(json);
  Map<String, dynamic> toJson() => _$HomeDataLeaveQuotaToJson(this);
}