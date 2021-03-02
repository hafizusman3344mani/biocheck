// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonResponse _$CommonResponseFromJson(Map<String, dynamic> json) {
  return CommonResponse()
    ..Result = json['Result']
    ..ExtraResult = json['ExtraResult']
    ..Messages = (json['Messages'] as List)
        ?.map((e) => e == null
            ? null
            : CommonMessage.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..ErrorMessages = (json['ErrorMessages'] as List)
        ?.map((e) => e == null
            ? null
            : CommonMessage.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..HasErrors = json['HasErrors'] as bool
    ..IsValid = json['IsValid'] as bool;
}

Map<String, dynamic> _$CommonResponseToJson(CommonResponse instance) =>
    <String, dynamic>{
      'Result': instance.Result,
      'ExtraResult': instance.ExtraResult,
      'Messages': instance.Messages,
      'ErrorMessages': instance.ErrorMessages,
      'HasErrors': instance.HasErrors,
      'IsValid': instance.IsValid,
    };
