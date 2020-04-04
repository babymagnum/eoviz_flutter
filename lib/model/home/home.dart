import 'package:json_annotation/json_annotation.dart';
import 'home_data.dart';

part 'home.g.dart';

@JsonSerializable()
class Home {

  Home(this.data, this.messages, this.status);

  bool status;
  List<String> messages = List();
  HomeData data;

  factory Home.fromJson(Map<String, dynamic> json) => _$HomeFromJson(json);
  Map<String, dynamic> toJson() => _$HomeToJson(this);
}