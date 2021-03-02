import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
@entity
class User {
  @primaryKey
  int id;
  String establishment;
  String username;
  String password;
  String FranchiseId;

  User();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}