import 'package:json_annotation/json_annotation.dart';

part 'common_message.g.dart';

@JsonSerializable()
class CommonMessage {
  int Type;
  String TypeDescription;
  String Message;
  String Title;
  bool ShowInPage;


  CommonMessage();

  factory CommonMessage.fromJson(Map<String, dynamic> json) =>
      _$CommonMessageFromJson(json);

  Map<String, dynamic> toJson() => _$CommonMessageToJson(this);
}