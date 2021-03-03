import 'package:biocheck/db/entities/user_entity.dart';

class DBValues {
  UserEntity _userDao;

  DBValues._privateConstructor();

  static final DBValues instance = DBValues._privateConstructor();


  setUserEntity(UserEntity entity)
  {
    _userDao = entity;
  }

  UserEntity getUserEntity()
  {
    return _userDao;
  }
}
