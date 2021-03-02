// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProgramInfoModel _$ProgramInfoModelFromJson(Map<String, dynamic> json) {
  return ProgramInfoModel()
    ..IsValid = json['IsValid'] as bool
    ..HasProgram = json['HasProgram'] as bool
    ..HasActiveTill = json['HasActiveTill'] as bool
    ..ActiveTillAsString = json['ActiveTillAsString'] as String
    ..HtmlInfo = json['HtmlInfo'] as String
    ..AllowUserMobileAccessTillAsString =
        json['AllowUserMobileAccessTillAsString'] as String
    ..AllowUserMobileAccessTillAsStringEn =
        json['AllowUserMobileAccessTillAsStringEn'] as String
    ..AllowUserMobileAccessTill = json['AllowUserMobileAccessTill'] as String
    ..ActiveTill = json['ActiveTill'] as String
    ..CvpCountWithoutProgram = json['CvpCountWithoutProgram'] as int
    ..CurrentBlok = json['CurrentBlok'] as int
    ..TotalCvpCount = json['TotalCvpCount'] as int
    ..ActiveCvpCount = json['ActiveCvpCount'] as int
    ..ProgramTitle = json['ProgramTitle'] as String;
}

Map<String, dynamic> _$ProgramInfoModelToJson(ProgramInfoModel instance) =>
    <String, dynamic>{
      'IsValid': instance.IsValid,
      'HasProgram': instance.HasProgram,
      'HasActiveTill': instance.HasActiveTill,
      'ActiveTillAsString': instance.ActiveTillAsString,
      'HtmlInfo': instance.HtmlInfo,
      'AllowUserMobileAccessTillAsString':
          instance.AllowUserMobileAccessTillAsString,
      'AllowUserMobileAccessTillAsStringEn':
          instance.AllowUserMobileAccessTillAsStringEn,
      'AllowUserMobileAccessTill': instance.AllowUserMobileAccessTill,
      'ActiveTill': instance.ActiveTill,
      'CvpCountWithoutProgram': instance.CvpCountWithoutProgram,
      'CurrentBlok': instance.CurrentBlok,
      'TotalCvpCount': instance.TotalCvpCount,
      'ActiveCvpCount': instance.ActiveCvpCount,
      'ProgramTitle': instance.ProgramTitle,
    };
