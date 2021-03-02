// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..id = json['id'] as int
    ..establishment = json['establishment'] as String
    ..username = json['username'] as String
    ..password = json['password'] as String
    ..FranchiseId = json['FranchiseId'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'establishment': instance.establishment,
      'username': instance.username,
      'password': instance.password,
      'FranchiseId': instance.FranchiseId,
    };
