library frontend.globals;

import 'package:flutter/material.dart';
import 'package:frontend/Helper/violation.dart';

String? name = 'K-dawg';

int numViolations = violations.length;

int leaderboardPercentile = 69;

String? vehicleName = 'Kia Sportage';
String vehicleImage = 'assets/KiaSportage2015.png';

Violation violation1 = Violation("Stop sign", "Failure to stop", "1/10/2022 11:23:06", -100);
Violation violation2 = Violation("Speeding", "90 in 80 Zone", "10/10/2022 11:23:06", -90);
List<Violation> violations = [violation1, violation2];

const TextStyle headings = TextStyle(fontSize: 30, color: Colors.white);
const TextStyle violationsStyle = TextStyle(fontSize: 20, color: Colors.white);


