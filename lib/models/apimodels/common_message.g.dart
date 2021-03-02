// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonMessage _$CommonMessageFromJson(Map<String, dynamic> json) {
  return CommonMessage()
    ..Type = json['Type'] as int
    ..TypeDescription = json['TypeDescription'] as String
    ..Message = json['Message'] as String
    ..Title = json['Title'] as String
    ..ShowInPage = json['ShowInPage'] as bool;
}

Map<String, dynamic> _$CommonMessageToJson(CommonMessage instance) =>
    <String, dynamic>{
      'Type': instance.Type,
      'TypeDescription': instance.TypeDescription,
      'Message': instance.Message,
      'Title': instance.Title,
      'ShowInPage': instance.ShowInPage,
    };
