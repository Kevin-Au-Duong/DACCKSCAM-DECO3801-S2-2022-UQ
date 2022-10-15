import 'package:flutter/material.dart';
import 'package:frontend/Pages/leaderboard.dart';
import 'package:frontend/Pages/login.dart';
import 'package:frontend/Pages/home.dart';
import 'package:frontend/Pages/settings.dart';


import 'Pages/store.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/login': (context) => const Login(),
      '/home': (context) => const Home(),
      '/settings': (context) => const Settings(),
      '/leaderboard' : (context) => const Leaderboard(),
      '/store' : (context) => const Store(),
    },
  ));
}





