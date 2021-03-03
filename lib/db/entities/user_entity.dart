import 'package:floor/floor.dart';

@entity
class UserEntity {
  @PrimaryKey(autoGenerate: true)
  int id;
  int PersonId;
  String UserName;
  String Password;
  int FranchiseId;
  bool CanViewPhysicalStatusInfo;
  bool AllowMobileAccess;
  bool AllowWebAccess;
  bool AllowHistory;
  bool AllowZeroCheck;
  bool AllowFreeZeroCheck;
  bool AllowCvp;
  bool AllowFreeTraining;
  String Token;
  String ExpirationDateAsString;
  bool TokenIsValid;
  bool IsDarkTheme;

  UserEntity(
      this.id,
      this.PersonId,
      this.UserName,
      this.Password,
      this.FranchiseId,
      this.CanViewPhysicalStatusInfo,
      this.AllowMobileAccess,
      this.AllowWebAccess,
      this.AllowHistory,
      this.AllowZeroCheck,
      this.AllowFreeZeroCheck,
      this.AllowCvp,
      this.AllowFreeTraining,
      this.Token,
      this.ExpirationDateAsString,
      this.TokenIsValid,
      this.IsDarkTheme);

  UserEntity.fromEntity();
}
