import 'dart:core';

import 'package:frontend/Helper/violation.dart';

class Trip {
  String name;
  int tripNum;
  String startTime;
  String endTime;
  double distance;
  String duration;
  List<Violation> violationList;
  int numViolations;
  int totalTripPenalty;

  Trip(this.name, this.tripNum, this.startTime, this.endTime, this.distance,
       this.duration, this.violationList, this.numViolations, this.totalTripPenalty);
}