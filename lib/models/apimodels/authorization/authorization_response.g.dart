// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorization_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorizationResponse _$AuthorizationResponseFromJson(
    Map<String, dynamic> json) {
  return AuthorizationResponse()
    ..MessengerDeviceToken = json['MessengerDeviceToken'] as String
    ..PersonId = json['PersonId'] as int
    ..FranchiseId = json['FranchiseId'] as int
    ..AvatarLogoUrl = json['AvatarLogoUrl'] as String
    ..HasAvatarLogoUrl = json['HasAvatarLogoUrl'] as bool
    ..Token = json['Token'] as String
    ..UrlEncodedToken = json['UrlEncodedToken'] as String
    ..ExpirationDate = json['ExpirationDate'] as String
    ..ExpirationDateAsString = json['ExpirationDateAsString'] as String
    ..TokenIsValid = json['TokenIsValid'] as bool
    ..ProgramInfo = json['ProgramInfo'] == null
        ? null
        : ProgramInfoModel.fromJson(json['ProgramInfo'] as Map<String, dynamic>)
    ..UserRights = json['UserRights'] == null
        ? null
        : UserRightsModel.fromJson(json['UserRights'] as Map<String, dynamic>)
    ..ActivePeriodInfo = json['ActivePeriodInfo'] == null
        ? null
        : ActivePeriodInfoModel.fromJson(
            json['ActivePeriodInfo'] as Map<String, dynamic>)
    ..ProfileSettings = json['ProfileSettings'] == null
        ? null
        : ProfileSettingsModel.fromJson(
            json['ProfileSettings'] as Map<String, dynamic>);
}

Map<String, dynamic> _$AuthorizationResponseToJson(
        AuthorizationResponse instance) =>
    <String, dynamic>{
      'MessengerDeviceToken': instance.MessengerDeviceToken,
      'PersonId': instance.PersonId,
      'FranchiseId': instance.FranchiseId,
      'AvatarLogoUrl': instance.AvatarLogoUrl,
      'HasAvatarLogoUrl': instance.HasAvatarLogoUrl,
      'Token': instance.Token,
      'UrlEncodedToken': instance.UrlEncodedToken,
      'ExpirationDate': instance.ExpirationDate,
      'ExpirationDateAsString': instance.ExpirationDateAsString,
      'TokenIsValid': instance.TokenIsValid,
      'ProgramInfo': instance.ProgramInfo,
      'UserRights': instance.UserRights,
      'ActivePeriodInfo': instance.ActivePeriodInfo,
      'ProfileSettings': instance.ProfileSettings,
    };
