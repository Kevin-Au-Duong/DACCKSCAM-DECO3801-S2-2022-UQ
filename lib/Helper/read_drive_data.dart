import 'dart:core';
import 'package:flutter/services.dart';
import 'package:frontend/Helper/trip.dart';
import 'package:frontend/Helper/violation.dart';
import 'globals.dart';

class DriveData {
  String filename;
  DriveData(this.filename);

  parse() async {
    List<String> lines = await getLine();
    for (int tripNum = 0; tripNum < lines.length; tripNum++) {
      TRIPS.add(createTrip(lines[tripNum], tripNum));

    }
    return lines;
  }

  getLine() async {
    String chunk = await read();
    List<String> lines = chunk.split('\n');
    lines.removeLast();
    return lines;
  }

  Future<String> read() async {
    return await rootBundle.loadString("assets/drive_data/$filename.txt");
  }

  /// line element:
  /// 0: trip start time
  /// 1: trip end time
  /// 2: trip duration
  /// 3 and beyond: violation type
  Trip createTrip(String line, int tripNum) {
    List<String> data = line.split(',');
    List<Violation> violations = <Violation>[];
    int numViolationsType = data.length;
    int numViolations = 0;
    
    for (var i = 4; i < numViolationsType; i++) {
      List<String> violationString = data[i].split(':');
      String violationName = violationString[0];
      String violationOccurrencesString = violationString[1];
      int violationOccurrences = int.parse(violationOccurrencesString);
      String? severity = severityMapping[violationName];
      int? basePenalty = penaltyMapping[severity];
      int totalPenalty = basePenalty! * violationOccurrences;
      numViolations += violationOccurrences;

      violations.add(Violation(violationName, severity!, totalPenalty,
          violationOccurrences));
    }
    String name = 'Trip $tripNum';
    String startTime = data[0];
    String endTime = data[1];
    return Trip(name, tripNum, startTime, endTime, violations, numViolations);
  }
}