import 'package:biocheck/models/apimodels/common_message.dart';
import 'package:json_annotation/json_annotation.dart';

part 'common_response.g.dart';

@JsonSerializable()
class CommonResponse {
  Object Result;
  Object ExtraResult;
  List<CommonMessage> Messages;
  List<CommonMessage> ErrorMessages;
  bool HasErrors;
  bool IsValid;


  CommonResponse();

  factory CommonResponse.fromJson(Map<String, dynamic> json) =>
      _$CommonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CommonResponseToJson(this);
}