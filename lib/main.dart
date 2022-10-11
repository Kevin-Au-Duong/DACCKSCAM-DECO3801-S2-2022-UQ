import 'package:flutter/material.dart';
import 'package:frontend/Pages/leaderboard.dart';
import 'package:frontend/Pages/login.dart';
import 'package:frontend/Pages/home.dart';
import 'package:frontend/Pages/settings.dart';
import 'package:frontend/Pages/violations.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/login': (context) => const Login(),
      '/home': (context) => const Home(),
      '/settings': (context) => const Settings(),
    },
  ));
}





