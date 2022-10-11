import 'dart:core';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:path_provider/path_provider.dart';

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


}