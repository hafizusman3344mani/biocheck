import 'package:json_annotation/json_annotation.dart';

part 'program_info.g.dart';

@JsonSerializable()
class ProgramInfoModel {
  bool IsValid;
  bool HasProgram;
  bool HasActiveTill;
  String ActiveTillAsString;
  String HtmlInfo;
  String AllowUserMobileAccessTillAsString;
  String AllowUserMobileAccessTillAsStringEn;
  String AllowUserMobileAccessTill;
  String ActiveTill;
  int CvpCountWithoutProgram;
  int CurrentBlok;
  int TotalCvpCount;
  int ActiveCvpCount;
  String ProgramTitle;


  ProgramInfoModel();

  factory ProgramInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ProgramInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProgramInfoModelToJson(this);
}