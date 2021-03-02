import 'package:biocheck/models/apimodels/authorization/active_period_info.dart';
import 'package:biocheck/models/apimodels/authorization/user_rights.dart';
import 'package:json_annotation/json_annotation.dart';

import 'profile_settings.dart';
import 'program_info.dart';

part 'authorization_response.g.dart';

@JsonSerializable()
class AuthorizationResponse {
  String MessengerDeviceToken;
  int PersonId;
  int FranchiseId;
  String AvatarLogoUrl;
  bool HasAvatarLogoUrl;
  String Token;
  String UrlEncodedToken;
  String ExpirationDate;
  String ExpirationDateAsString;
  bool TokenIsValid;
  ProgramInfoModel ProgramInfo;
  UserRightsModel UserRights;
  ActivePeriodInfoModel ActivePeriodInfo;
  ProfileSettingsModel ProfileSettings;

  AuthorizationResponse();

  factory AuthorizationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorizationResponseToJson(this);
}
