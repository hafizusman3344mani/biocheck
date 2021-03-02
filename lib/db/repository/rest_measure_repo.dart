import 'package:biocheck/db/dao/rest_measure_dao.dart';
import 'package:biocheck/db/database/database_handler.dart';
import 'package:biocheck/db/entities/rest_measure_entity.dart';
import 'package:biocheck/db/entities/rest_measure_questionair.dart';

class RestMeasureRepo {
  RestMeasureDao restMeasureDao;

  RestMeasureRepo._privateConstructor();

  static final RestMeasureRepo instance = RestMeasureRepo._privateConstructor();

  _setUserDao() {
    if (restMeasureDao == null) restMeasureDao = DBManager.instance.database.restDao;
  }

  Future<RestMeasurementEntity> mapData(RestMeasurementEntity result) async {
    await DBManager.instance.getDB();
    _setUserDao();

    int id = await insertData(result);
    result.id = id;
    return result;
  }

  Future<RestQuestionnaire> mapQuesData(RestQuestionnaire result) async {
    await DBManager.instance.getDB();
    _setUserDao();

    await insertQuesData(result);
    return result;
  }

  Future<int> insertData(RestMeasurementEntity entity) async {
    int id = await restMeasureDao.insertRestMeasurement(entity);
    return id;
  }

  insertQuesData(RestQuestionnaire entity) async {
    await restMeasureDao.insertRestMeasurementQues(entity);
  }

  updateQuesData(RestQuestionnaire entity) async {
    await restMeasureDao.updateMeasurementQuesById(entity);
  }


  Future< List<RestMeasurementEntity>> getMeasurement() async {
    try {
      await DBManager.instance.getDB();
      _setUserDao();
      List<RestMeasurementEntity> result = await restMeasureDao.findMeasurement();
      if (result != null) {
        if (result.isNotEmpty) {
          return result;
        } else {
          return [];
        }
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<RestMeasurementEntity> getMeasurementById(int id) async {
    try {
      await DBManager.instance.getDB();
      _setUserDao();
      List<RestMeasurementEntity> result = await restMeasureDao.findMeasurementById(id);
      if (result != null) {
        if (result.isNotEmpty) {
          return result[0];
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future< List<RestQuestionnaire>> getMeasurementQues(int id) async {
    try {
      await DBManager.instance.getDB();
      _setUserDao();
      List<RestQuestionnaire> result = await restMeasureDao.findMeasurementQues(id);
      if (result != null) {
        if (result.isNotEmpty) {
          return result;
        } else {
          return [];
        }
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
