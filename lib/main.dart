import 'package:flutter/material.dart';
import 'package:frontend/Pages/login.dart';
import 'package:frontend/Pages/home.dart';
import 'package:frontend/Pages/settings.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/login',
    routes: {
      '/login': (context) => const Login(),
      '/home': (context) => const Home(),
      '/settings': (context) => const Settings(),
    },
  ));
}





