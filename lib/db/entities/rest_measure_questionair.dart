import 'package:floor/floor.dart';

@entity
class RestQuestionnaire {
  @PrimaryKey(autoGenerate: true)
  int id;
  int mId;
  int qID;
  String qIDString;
  double rating;
  String notes;


  RestQuestionnaire(this.id, this.mId, this.qID, this.qIDString,this.rating, this.notes);

  RestQuestionnaire.fromClass();
}
