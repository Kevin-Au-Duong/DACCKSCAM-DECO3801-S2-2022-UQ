library frontend.globals;

import 'package:frontend/Helper/violation.dart';

String? name = 'K-dawg';

int numViolations = violations.length;

int leaderboardPercentile = 69;

String? vehicleName = 'Kia Sportage';
String vehicleImage = 'assets/KiaSportage2015.png';

Violation violation1 = Violation("Stop sign", "Failure to stop", -100);
Violation violation2 = Violation("Speeding", "90 in 80 Zone", -90);
List<Violation> violations = [violation1, violation2];


