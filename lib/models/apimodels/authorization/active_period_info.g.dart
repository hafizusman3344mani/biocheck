// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_period_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivePeriodInfoModel _$ActivePeriodInfoModelFromJson(
    Map<String, dynamic> json) {
  return ActivePeriodInfoModel()
    ..HasValidTill = json['HasValidTill'] as bool
    ..RemainingDays = json['RemainingDays'] as int
    ..ValidTillAsString = json['ValidTillAsString'] as String
    ..ValidTill = json['ValidTill'] as String;
}

Map<String, dynamic> _$ActivePeriodInfoModelToJson(
        ActivePeriodInfoModel instance) =>
    <String, dynamic>{
      'HasValidTill': instance.HasValidTill,
      'RemainingDays': instance.RemainingDays,
      'ValidTillAsString': instance.ValidTillAsString,
      'ValidTill': instance.ValidTill,
    };
