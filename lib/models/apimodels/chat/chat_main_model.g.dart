// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_main_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMainModel _$ChatMainModelFromJson(Map<String, dynamic> json) {
  return ChatMainModel()
    ..id = json['id'] as int
    ..dateString = json['dateString'] as String
    ..messages = (json['messages'] as List)
        ?.map((e) =>
            e == null ? null : ChatSubModel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ChatMainModelToJson(ChatMainModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dateString': instance.dateString,
      'messages': instance.messages,
    };
