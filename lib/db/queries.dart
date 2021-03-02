class DBQueries {


  //region UserEntity

  static const String findUser =
      'SELECT * FROM ' + Tables.UserEntity;

  static const String deleteUser =
      'DELETE FROM ' + Tables.UserEntity;

  //endregion

  static const String findConnectionSettings =
      'SELECT * FROM ' + Tables.Connection;

  static const String deleteConnections =
      'DELETE FROM ' + Tables.Connection;

  //region Rest Measurement
  static const String findMeasurement =
      'SELECT * FROM ' + Tables.RestMeasure;

  static const String findMeasurementById =
      'SELECT * FROM ' + Tables.RestMeasure + ' WHERE id = :id' ;

  static const String findMeasurementQues =
      'SELECT * FROM ' + Tables.RestMeasureQues + ' WHERE mId = :id' ;

}

class Tables {
  static const String UserEntity = "UserEntity";
  static const String Connection = "Connection";
  static const String RestMeasure = "RestMeasurementEntity";
  static const String RestMeasureQues = "RestQuestionnaire";
}
