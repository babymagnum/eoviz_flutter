// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_data_presence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDataPresence _$HomeDataPresenceFromJson(Map<String, dynamic> json) {
  return HomeDataPresence(json['achievement'] as int, json['target'] as int);
}

Map<String, dynamic> _$HomeDataPresenceToJson(HomeDataPresence instance) =>
    <String, dynamic>{
      'target': instance.target,
      'achievement': instance.achievement
    };
