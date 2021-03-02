import 'package:json_annotation/json_annotation.dart';

import 'franchise.dart';

part 'franchise_response.g.dart';

@JsonSerializable()
class FranchiseResponse {
  List<Franchise> franchises;

  FranchiseResponse();

  factory FranchiseResponse.fromJson(Map<String, dynamic> json) =>
      _$FranchiseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FranchiseResponseToJson(this);
}
