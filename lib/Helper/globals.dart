library frontend.globals;

import 'package:flutter/material.dart';
import 'package:frontend/Helper/trip.dart';
import 'package:frontend/Helper/violation.dart';

import 'friend.dart';

String? name = 'K-dawg';

int leaderboardPercentile = 69;

String? vehicleName = 'Kia Sportage';
String vehicleImage = 'assets/KiaSportage2015.png';

List<Trip> TRIPS = [];


int CURRENTTRIP = -1;

Friend kevin = Friend("Kevin", 150, "assets/kia sportage icon.png");
Friend adriene = Friend("Adriene", 75, "assets/ferrari icon.jpg");
Friend clay = Friend("Clay", 500, "assets/old ute icon.jpg");
Friend chuxue = Friend("Chuxue", -50, "assets/bmw sedan icon.jpg");
Friend sanya = Friend("Sanya", 50, "assets/lambo icon.jpg");
Friend david = Friend("David", 400, "assets/suv icon.jpg");

List<Friend> friends = [kevin, adriene, clay, chuxue, sanya, david];

const TextStyle headings = TextStyle(fontSize: 30, color: Colors.white);
const TextStyle violationsStyle = TextStyle(fontSize: 20, color: Colors.white);
const TextStyle minorViolationsStyle = TextStyle(fontSize: 20, color: Colors.lightGreen);
const TextStyle majorViolationsStyle = TextStyle(fontSize: 20, color: Colors.yellow);
const TextStyle fatallySeriousViolationsStyle = TextStyle(fontSize: 20, color: Colors.red);


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


