import 'package:biocheck/db/entities/rest_measure_entity.dart';
import 'package:biocheck/db/entities/rest_measure_questionair.dart';
import 'package:biocheck/db/queries.dart';
import 'package:biocheck/db/entities/user_entity.dart';
import 'package:biocheck/models/apimodels/authorization/user.dart';
import 'package:floor/floor.dart';

@dao
abstract class RestMeasureDao {

  @Query(DBQueries.findMeasurement)
  Future<List<RestMeasurementEntity>> findMeasurement();

  @Query(DBQueries.findMeasurementById)
  Future<List<RestMeasurementEntity>> findMeasurementById(int id);

  @update
  Future<void> updateMeasurementQuesById(RestQuestionnaire questionnaire);

  @Query(DBQueries.findMeasurementQues)
  Future<List<RestQuestionnaire>> findMeasurementQues(int id);

  @insert
  Future<int> insertRestMeasurement(RestMeasurementEntity user);

  @insert
  Future<void> insertRestMeasurementQues(RestQuestionnaire user);

}