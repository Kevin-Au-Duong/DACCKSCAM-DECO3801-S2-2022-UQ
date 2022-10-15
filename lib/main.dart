import 'package:flutter/material.dart';
import 'package:frontend/Helper/read_drive_data.dart';
import 'package:frontend/Pages/leaderboard.dart';
import 'package:frontend/Pages/login.dart';
import 'package:frontend/Pages/home.dart';
import 'package:frontend/Pages/settings.dart';
import 'package:frontend/Pages/history.dart';

import 'Pages/store.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/login',
    routes: {
      '/login': (context) => const Login(),
      '/home': (context) => const Home(),
      '/settings': (context) => const Settings(),
      '/leaderboard' : (context) => const Leaderboard(),
      '/store' : (context) => const Store(),
      '/history' : (context) => const History(),
    },
  ));
}





