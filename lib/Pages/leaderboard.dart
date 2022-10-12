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
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 12),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: const [
              //       Text("Friend",
              //         style: headings),
              //       Text("Points",
              //         style: headings),
              //     ]
              //   ),
              // ),
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
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("Congratulations! Your score of $points this week puts you in the top 69% of all drivers using our platform. Keep driving safely to increase your rank and earn more K-dollars!",
                        style: violationsStyle),
                  ]
                ),
              ),
              const Spacer(),
            ],
        ),
      ),
    );
  }
}

List<Widget> buildLeaderboard() {
  friends.sort((a, b) => b.points.compareTo(a.points));
  List<Widget> lines = [];
  for (Friend friend in friends) {
    TextStyle style;
    if (friend == user) {
      style = const TextStyle(fontSize: 30, color: Colors.red);
    }
    else {
      style = headings;
    }
    var row = Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
      child: Row(
        children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image(image: AssetImage(friend.avatarPath), height:28, width: 35, fit: BoxFit.contain),
                ),
                Text(friend.name,
                  style: style),
              ],
            ),
            const Spacer(),
            Text(friend.points.toString(),
              style: const TextStyle(fontSize: 30, color: Colors.deepPurpleAccent))
          ]
      ),
    );
    lines.add(row);
  }
  return lines;
}


