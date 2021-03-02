// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'franchise_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FranchiseResponse _$FranchiseResponseFromJson(Map<String, dynamic> json) {
  return FranchiseResponse()
    ..franchises = (json['franchises'] as List)
        ?.map((e) =>
            e == null ? null : Franchise.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$FranchiseResponseToJson(FranchiseResponse instance) =>
    <String, dynamic>{
      'franchises': instance.franchises,
    };
