// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_sub_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatSubModel _$ChatSubModelFromJson(Map<String, dynamic> json) {
  return ChatSubModel()
    ..id = json['id'] as int
    ..text = json['text'] as String
    ..image = json['image'] as String
    ..messageType = json['messageType'] as int
    ..isSender = json['isSender'] as bool;
}

Map<String, dynamic> _$ChatSubModelToJson(ChatSubModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'image': instance.image,
      'messageType': instance.messageType,
      'isSender': instance.isSender,
    };
