import 'package:floor/floor.dart';

@entity
class RestMeasurementEntity {
  @PrimaryKey(autoGenerate: true)
  int id;
  int startTime;
  int endTime;
  int hr;
  double amp;
  int stressLevel;
  String stressLevelString;
  String timeElapse;
  String timeStressRelax;
  String timeStressNormal;
  String timeStressLow;
  String timeStressHeavy;
  int percStressHeavy;
  int percStressRelax;
  int percStressNormal;
  int percStressLow;
  int createdDate;
  bool completed;


  RestMeasurementEntity(
      this.id,
      this.startTime,
      this.endTime,
      this.hr,
      this.amp,
      this.stressLevel,
      this.stressLevelString,
      this.timeElapse,
      this.timeStressRelax,
      this.timeStressNormal,
      this.timeStressLow,
      this.timeStressHeavy,
      this.percStressHeavy,
      this.percStressRelax,
      this.percStressNormal,
      this.percStressLow,
      this.createdDate,
      this.completed);

  RestMeasurementEntity.fromClass();
}
