import 'package:biocheck/common/utils/theme_color_mode.dart';
import 'package:biocheck/controllers/heart_rate_controller.dart';
import 'package:biocheck/db/dao/user_dao.dart';
import 'package:biocheck/db/database/database_handler.dart';
import 'package:biocheck/db/entities/user_entity.dart';
import 'package:biocheck/models/apimodels/authorization/authorization_response.dart';
import 'package:biocheck/models/local/result.dart';
import 'package:get/get.dart';

import '../db_values.dart';

class UserRepo {
  UserDao userDao;

  UserRepo._privateConstructor();

  static final UserRepo instance = UserRepo._privateConstructor();

  _setUserDao() {
    if (userDao == null) userDao = DBManager.instance.database.userDao;
  }

  Future<UserEntity> mapUser(AuthorizationResponse result) async {
    await DBManager.instance.getDB();
    _setUserDao();
    var u = UserEntity.fromEntity();
    u.AllowCvp = result.UserRights.AllowCvp;
    u.AllowFreeTraining = result.UserRights.AllowFreeTraining;
    u.CanViewPhysicalStatusInfo = result.UserRights.CanViewPhysicalStatusInfo;
    u.AllowMobileAccess = result.UserRights.AllowMobileAccess;
    u.AllowWebAccess = result.UserRights.AllowWebAccess;
    u.AllowHistory = result.UserRights.AllowHistory;
    u.AllowZeroCheck = result.UserRights.AllowZeroCheck;
    u.AllowFreeZeroCheck = result.UserRights.AllowFreeZeroCheck;
    u.IsDarkTheme = false;
    u.FranchiseId = result.FranchiseId;
    u.PersonId = result.PersonId;
    u.UserName = result.PersonId.toString();
    u.Token = result.Token;
    u.ExpirationDateAsString = result.ExpirationDateAsString;
    u.TokenIsValid = result.TokenIsValid;
    u.Password = result.PersonId.toString();
    DBValues.instance.setUserEntity(u);
    await insertUser(u);
    return u;
  }

  insertUser(UserEntity entity) async {
    await userDao.deleteUser();
    await userDao.insertUserEntity(entity);
  }

  Future<bool> getUser() async {
    try {
      await DBManager.instance.getDB();
      _setUserDao();
      List<UserEntity> result = await userDao.findUser();
      if (result != null) {
        if (result.isNotEmpty) {
          DBValues.instance.setUserEntity(result[0]);
          ColorResources.instance.setMode(DBValues.instance.getUserEntity().IsDarkTheme);
          if (result[0].TokenIsValid) {
            return true;
          } else {
            return false;
          }
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  deleteUser() async {
    await userDao.deleteUser();
    DBValues.instance.setUserEntity(UserEntity.fromEntity());
  }
}
