import 'dart:core';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:frontend/Helper/trip.dart';
import 'package:frontend/Helper/violation.dart';
import 'package:permission_handler/permission_handler.dart';
//import 'package:simple_permissions/simple_permissions.dart';
import 'globals.dart';

class DriveData {
  String filename;
  DriveData(this.filename);

  parse() async {
    List<String> lines = await getLine();
    for (int tripNum = 0; tripNum < lines.length; tripNum++) {
      TRIPS.add(createTrip(lines[tripNum], tripNum));
    }
    //return lines;
  }

  getLine() async {
    String chunk = await read();
    List<String> lines = chunk.split('\n');
    lines.removeLast();
    return lines;
  }

  Future<String> read() async {
    const permission = Permission.storage;
    Map<Permission, PermissionStatus> statuses = await [
      Permission.manageExternalStorage ,
      Permission.storage,
    ].request();

    if (statuses != PermissionStatus.granted) {
      await permission.request();
      if(await permission.status.isGranted){
        //String directory = '/storage/emulated/0/Android/data/com.DACCKS.DACCKSCam/files/save.txt';
        String directory = '/storage/emulated/0/Music/save.txt';
        ///perform other stuff to download file
      } else {
        await permission.request();
      }
    }
    //String directory = '/storage/emulated/0/Android/data/com.DACCKS.DACCKSCam/files/save.txt';
    String directory = '/storage/emulated/0/Music/save.txt';
    return File(directory).readAsStringSync();
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