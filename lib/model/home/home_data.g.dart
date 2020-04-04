// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeData _$HomeDataFromJson(Map<String, dynamic> json) {
  return HomeData(
      json['photo'] as String,
      json['emp_name'] as String,
      json['emp_id'] as int,
      json['leave_quota'] == null
          ? null
          : HomeDataLeaveQuota.fromJson(
              json['leave_quota'] as Map<String, dynamic>),
      json['presence'] == null
          ? null
          : HomeDataPresence.fromJson(json['presence'] as Map<String, dynamic>),
      json['shift_name'] as String,
      json['status_presence'] as String,
      json['time_presence'] as String);
}

Map<String, dynamic> _$HomeDataToJson(HomeData instance) => <String, dynamic>{
      'emp_id': instance.emp_id,
      'emp_name': instance.emp_name,
      'photo': instance.photo,
      'shift_name': instance.shift_name,
      'status_presence': instance.status_presence,
      'time_presence': instance.time_presence,
      'presence': instance.presence,
      'leave_quota': instance.leave_quota
    };
