import 'package:json_annotation/json_annotation.dart';

part 'chat_sub_model.g.dart';

@JsonSerializable()
class ChatSubModel {
  int id;
  String text;
  String image;
  int messageType;
  bool isSender;

  ChatSubModel();

  factory ChatSubModel.fromJson(Map<String, dynamic> json) =>
      _$ChatSubModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatSubModelToJson(this);
}
