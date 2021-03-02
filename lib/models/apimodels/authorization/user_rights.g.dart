// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_rights.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRightsModel _$UserRightsModelFromJson(Map<String, dynamic> json) {
  return UserRightsModel()
    ..CanViewPhysicalStatusInfo = json['CanViewPhysicalStatusInfo'] as bool
    ..AllowMobileAccess = json['AllowMobileAccess'] as bool
    ..AllowWebAccess = json['AllowWebAccess'] as bool
    ..AllowHistory = json['AllowHistory'] as bool
    ..AllowZeroCheck = json['AllowZeroCheck'] as bool
    ..AllowFreeZeroCheck = json['AllowFreeZeroCheck'] as bool
    ..AllowCvp = json['AllowCvp'] as bool
    ..AllowFreeTraining = json['AllowFreeTraining'] as bool;
}

Map<String, dynamic> _$UserRightsModelToJson(UserRightsModel instance) =>
    <String, dynamic>{
      'CanViewPhysicalStatusInfo': instance.CanViewPhysicalStatusInfo,
      'AllowMobileAccess': instance.AllowMobileAccess,
      'AllowWebAccess': instance.AllowWebAccess,
      'AllowHistory': instance.AllowHistory,
      'AllowZeroCheck': instance.AllowZeroCheck,
      'AllowFreeZeroCheck': instance.AllowFreeZeroCheck,
      'AllowCvp': instance.AllowCvp,
      'AllowFreeTraining': instance.AllowFreeTraining,
    };
