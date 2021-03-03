import 'package:biocheck/db/queries.dart';
import 'package:biocheck/db/entities/user_entity.dart';
import 'package:biocheck/models/apimodels/authorization/user.dart';
import 'package:floor/floor.dart';

@dao
abstract class UserDao {

  @Query(DBQueries.findUser)
  Future<List<UserEntity>> findUser();

  @insert
  Future<void> insertUserEntity(UserEntity user);


  @Query(DBQueries.deleteUser)
  Future<void> deleteUser();
}