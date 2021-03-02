import 'dart:async';
import 'package:biocheck/common/constants.dart';
import 'package:biocheck/db/dao/connection_dao.dart';
import 'package:biocheck/db/dao/rest_measure_dao.dart';
import 'package:biocheck/db/dao/user_dao.dart';
import 'package:biocheck/db/entities/connection.dart';
import 'package:biocheck/db/entities/rest_measure_entity.dart';
import 'package:biocheck/db/entities/rest_measure_questionair.dart';
import 'package:biocheck/db/entities/user_entity.dart';
import 'package:biocheck/models/apimodels/authorization/user.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart'; // the generated code will be there

@Database(version: Constants.DATABASE_VERSION, entities: [UserEntity,Connection,RestMeasurementEntity,RestQuestionnaire])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
  ConnectionDao get connectionDao;
  RestMeasureDao get restDao;
}