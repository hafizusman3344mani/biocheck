import 'package:json_annotation/json_annotation.dart';

part 'user_rights.g.dart';

@JsonSerializable()
class UserRightsModel {
  bool CanViewPhysicalStatusInfo;
  bool AllowMobileAccess;
  bool AllowWebAccess;
  bool AllowHistory;
  bool AllowZeroCheck;
  bool AllowFreeZeroCheck;
  bool AllowCvp;
  bool AllowFreeTraining;


  UserRightsModel();

  factory UserRightsModel.fromJson(Map<String, dynamic> json) =>
      _$UserRightsModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserRightsModelToJson(this);
}