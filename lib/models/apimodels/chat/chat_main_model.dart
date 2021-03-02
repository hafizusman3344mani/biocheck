import 'package:biocheck/models/apimodels/chat/chat_sub_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_main_model.g.dart';

@JsonSerializable()
class ChatMainModel {
  int id;
  String dateString;
  List<ChatSubModel> messages;

  ChatMainModel();

  factory ChatMainModel.fromJson(Map<String, dynamic> json) => _$ChatMainModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMainModelToJson(this);
}