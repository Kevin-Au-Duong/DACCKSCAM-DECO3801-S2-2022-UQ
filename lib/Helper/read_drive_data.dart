import 'dart:core';
import 'dart:async';

import 'package:flutter/services.dart';


class DriveData {
  String filename;
  DriveData(this.filename);

  Future<String> read() async {
    return await rootBundle.loadString("assets/drive_data/$filename.txt");
  }

  getLine() async {
    String chunk = await read();
    List<String> lines = chunk.split('\n');
    lines.removeLast();
    return lines;
  }


  /// line element:
  /// 0: trip start time
  /// 1: trip end time
  /// 2: trip duration
  /// 3 and beyond: violation type
  createViolations(String line) {
    List<String> data = line.split(',');
    int numViolations = data.length;
    for (var i = numViolations; i >= 4; i--) {
      //Violation violation = new Violation(name, timestamp, severity);
    }


  }
}