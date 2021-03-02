import 'package:flutter/cupertino.dart';

class UserEvent
{
  Gradient gradient;
  List<Event> events;

  UserEvent(this.gradient, this.events);
}

class Event{
  String date;
  String time1;
  String time2;
  String MeasurementType;

  Event(this.date, this.time1, this.time2, this.MeasurementType);
}