// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'franchise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Franchise _$FranchiseFromJson(Map<String, dynamic> json) {
  return Franchise()
    ..Id = json['Id'] as int
    ..Name = json['Name'] as String;
}

Map<String, dynamic> _$FranchiseToJson(Franchise instance) => <String, dynamic>{
      'Id': instance.Id,
      'Name': instance.Name,
    };
