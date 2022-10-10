import 'package:flutter/material.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        elevation: 0,
        title: IconButton(
          padding: EdgeInsets.zero,
          icon: const Icon(Icons.home, size: 40),
          onPressed: () {
            //Navigator.pushNamedAndRemoveUntil(context, '/home', (_) => false);
          },
        ),

        /*
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back, size: 40),
            onPressed: () => Navigator.pop(context, false),
          ),
        ], // actions = right side of app bar, for back button if needed
        */

      ),
      // body: const Text("DAACKS"), backgroundColor: Colors.deepPurple,
      body: const LeaderboardBody(), backgroundColor: Colors.deepPurple,
    );
  }
}

class LeaderboardBody extends StatefulWidget {
  const LeaderboardBody({super.key});
  @override
  State<LeaderboardBody> createState() => _LeaderboardBodyState();
}

class _LeaderboardBodyState extends State<LeaderboardBody> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
        alignment: Alignment.center,
        height: 700,
        width: 500,
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("Leaderboard",
                    style: TextStyle(fontSize: 30, color: Colors.white)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Clay",
                      style: TextStyle(fontSize: 24, color: Colors.white)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("500",
                        style: TextStyle(fontSize: 24, color: Colors.white)),
                  ),
                ],
              ),
            ],
        ),
    ),
    );
  }
}

