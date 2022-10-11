library frontend.globals;

import 'package:flutter/material.dart';
import 'package:frontend/Helper/trip.dart';
import 'package:frontend/Helper/violation.dart';

String? name = 'K-dawg';

int leaderboardPercentile = 69;

String? vehicleName = 'Kia Sportage';
String vehicleImage = 'assets/KiaSportage2015.png';

List<Trip> TRIPS = [];


int CURRENTTRIP = -1;

const TextStyle headings = TextStyle(fontSize: 30, color: Colors.white);
const TextStyle violationsStyle = TextStyle(fontSize: 20, color: Colors.white);
int points = 500;

Map<String, String> severityMapping = {
  'Stop Sign': 'Minor',
  'Give Way Sign': 'Minor',
  'Illegal Parking': 'Minor',
  'Speeding': 'Major',
  'Jumping Red Light': 'Major',
  'Distracted Driving': 'Major',
  'DUI': 'Fatally Serious',
  'Wrong-way driving': 'Fatally Serious',
  'Hooning': 'Fatally Serious',
};

Map<String, int> penaltyMapping = {
  'Minor': -69,
  'Major': -420,
  'Fatally Serious': 80085,
};


