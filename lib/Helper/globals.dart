library frontend.globals;

import 'package:flutter/material.dart';
import 'package:frontend/Helper/store_item.dart';
import 'package:frontend/Helper/trip.dart';
import 'package:frontend/Helper/violation.dart';

import 'friend.dart';

String name = 'K-dawg';

int leaderboardPercentile = 69;

String vehicleName = 'Kia Sportage';
String vehicleImage = 'assets/KiaSportage2015.png';
List<Violation> emptyList = [];

Trip placeholderTrip = Trip('Placeholder', 0, '0', '0', emptyList, 0);

//Trip dummy1 = Trip()

List<Trip> TRIPS = [placeholderTrip];

int CURRENTTRIP = 0;

int totalPoints = 350;

Friend adriene = Friend("Adriene", 75, "assets/ferrari icon.jpg");
Friend clay = Friend("Clay", 500, "assets/old ute icon.jpg");
Friend chuxue = Friend("Chuxue", -50, "assets/bmw sedan icon.jpg");
Friend sanya = Friend("Sanya", 50, "assets/lambo icon.jpg");
Friend david = Friend("David", 400, "assets/suv icon.jpg");
Friend user = Friend("K-Dawg", 350, "assets/KiaSportage2015.png");

List<Friend> friends = [];

StoreItem kia = StoreItem("Kia Sportage", 100, "assets/KiaSportage2015.png");
StoreItem ute = StoreItem("Vintage Ute", 50, "assets/old ute.jpg");
StoreItem lambo = StoreItem("Lamborghini", 1000, "assets/lambo.jpg");
StoreItem ferrari = StoreItem("Ferrari", 2000, "assets/ferrari.jpg");
StoreItem bmw = StoreItem("BMW Sedan", 500, "assets/bmw sedan.jpg");
StoreItem suv = StoreItem("Jeep SUV", 250, "assets/suv.jpg");

List<StoreItem> STORE = [kia, ute, suv, bmw, lambo, ferrari];


const Icon leftArrow = Icon(Icons.arrow_left_outlined, color: Colors.deepPurpleAccent);
const Icon rightArrow = Icon(Icons.arrow_right_outlined, color: Colors.deepPurpleAccent);

const TextStyle headings = TextStyle(fontSize: 30, color: Colors.white);
const TextStyle violationsStyle = TextStyle(fontSize: 20, color: Colors.white);
const TextStyle minorViolationsStyle = TextStyle(fontSize: 20, color: Colors.lightGreen);
const TextStyle majorViolationsStyle = TextStyle(fontSize: 20, color: Colors.yellow);
const TextStyle fatallySeriousViolationsStyle = TextStyle(fontSize: 20, color: Colors.red);

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
  'Minor': -50,
  'Major': -100,
  'Fatally Serious': -250,
};


