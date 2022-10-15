import 'dart:core';

import 'package:frontend/Helper/violation.dart';

class Trip {
  String name;
  int tripNum;
  String startTime;
  String endTime;
  List<Violation> violationList;
  int numViolations;
  int totalTripPenalty;

  Trip(this.name, this.tripNum, this.startTime, this.endTime, this.violationList, this.numViolations, this.totalTripPenalty);
}