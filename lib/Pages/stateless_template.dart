import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        elevation: 0,

        title: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, '/home', (_) => false);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          ),
        ], // actions = right side of app bar, for back button if needed
      ),
      // body: const Text("DAACKS"), backgroundColor: Colors.deepPurple,
      body: const SettingsBody(), backgroundColor: Colors.deepPurple,
    );
  }
}

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      alignment: Alignment.center,
      height: 700,
      width: 500,
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50)
          )
      ),
      child: const Text(
          "Settings",
          style: TextStyle(fontSize: 30, color: Colors.white)),
    ),
    );
  }
}



