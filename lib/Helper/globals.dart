library frontend.globals;

import 'package:flutter/material.dart';
import 'package:frontend/Helper/violation.dart';

String? name = 'K-dawg';

int numViolations = violations.length;

int leaderboardPercentile = 69;

String? vehicleName = 'Kia Sportage';
String vehicleImage = 'assets/KiaSportage2015.png';

Violation violation1 = Violation("Stop sign", "Minor", -69);
Violation violation2 = Violation("Speeding", "Major", -420);
List<Violation> violations = [violation1, violation2];

const TextStyle headings = TextStyle(fontSize: 30, color: Colors.white);
const TextStyle violationsStyle = TextStyle(fontSize: 20, color: Colors.white);

int points = 500;


