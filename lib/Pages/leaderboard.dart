import 'package:flutter/material.dart';

import '../Helper/friend.dart';
import '../Helper/globals.dart';

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
            Navigator.pushNamedAndRemoveUntil(context, '/home', (_) => false);
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
                    style: headings),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text("Friend",
                      style: headings),
                    Text("Points",
                      style: headings),
                  ]
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Column(
                   children: buildLeaderboard()),
                  //   Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Text(name!,
                  //       style: const TextStyle(fontSize: 20, color: Colors.white)),
                  //   ),
                  //   Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Text(points.toString(),
                  //         style: const TextStyle(fontSize: 20, color: Colors.white)),
                  //   ),
                  // ],
                ),
            ],
        ),
      ),
    );
  }
}

List<Widget> buildLeaderboard() {
  friends.sort((a, b) => a.points.compareTo(b.points));
  List<Widget> lines = [];
  for (Friend friend in friends) {
    var row = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Spacer(),
          Expanded(
            child: Text(friend.name,
              style: headings),
          ),
          Expanded(
          child: Text(friend.points.toString(),
            style: headings)
          ),
        ]
    );
    lines.add(row);
  }
  return lines;
}


