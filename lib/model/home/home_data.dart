import 'package:json_annotation/json_annotation.dart';
import 'home_data_presence.dart';
import 'home_data_leavequota.dart';

part 'home_data.g.dart';

@JsonSerializable()
class HomeData {

  HomeData(this.photo, this.emp_name, this.emp_id, this.leave_quota, this.presence, this.shift_name,
    this.status_presence, this.time_presence);

  int emp_id;
  String emp_name;
  String photo;
  String shift_name;
  String status_presence;
  String time_presence;
  HomeDataPresence presence;
  HomeDataLeaveQuota leave_quota;

  factory HomeData.fromJson(Map<String, dynamic> json) => _$HomeDataFromJson(json);
  Map<String, dynamic> toJson() => _$HomeDataToJson(this);
}