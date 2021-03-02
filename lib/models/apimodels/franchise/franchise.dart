import 'package:json_annotation/json_annotation.dart';

part 'franchise.g.dart';

@JsonSerializable()
  class Franchise {
  int Id;
  String Name;

  Franchise();

  factory Franchise.fromJson(Map<String, dynamic> json) =>
      _$FranchiseFromJson(json);

  Map<String, dynamic> toJson() => _$FranchiseToJson(this);
}
