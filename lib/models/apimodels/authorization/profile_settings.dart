import 'package:json_annotation/json_annotation.dart';

part 'profile_settings.g.dart';

@JsonSerializable()
class ProfileSettingsModel {

  double DefaultAT;


  ProfileSettingsModel();

  factory ProfileSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileSettingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileSettingsModelToJson(this);
}