import 'package:json_annotation/json_annotation.dart';

part 'home_data_presence.g.dart';

@JsonSerializable()
class HomeDataPresence {

  HomeDataPresence(this.achievement, this.target);

  int target;
  int achievement;

  factory HomeDataPresence.fromJson(Map<String, dynamic> json) => _$HomeDataPresenceFromJson(json);
  Map<String, dynamic> toJson() => _$HomeDataPresenceToJson(this);
}