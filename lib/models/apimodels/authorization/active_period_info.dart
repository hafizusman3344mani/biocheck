import 'package:json_annotation/json_annotation.dart';

part 'active_period_info.g.dart';

@JsonSerializable()
class ActivePeriodInfoModel {
  bool HasValidTill;
  int RemainingDays;
  String ValidTillAsString;
  String ValidTill;

  ActivePeriodInfoModel();

  factory ActivePeriodInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ActivePeriodInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActivePeriodInfoModelToJson(this);
}