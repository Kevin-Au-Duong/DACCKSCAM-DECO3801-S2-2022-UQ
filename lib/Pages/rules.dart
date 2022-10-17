import 'package:flutter/material.dart';

import '../Helper/globals.dart';

class Rules extends StatelessWidget {
  const Rules({super.key});

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
      body: const RulesBody(), backgroundColor: Colors.deepPurple,
    );
  }
}

class RulesBody extends StatelessWidget {
  const RulesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          color: Colors.black,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("QLD Driving Rules",
                  style: TextStyle(fontSize: 30, color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Stop Sign",
                                textAlign: TextAlign.left,
                                style: violationsStyle),
                          ],
                        ),
                      ),
                      const Text("At a stop sign you must come to a complete stop and obey the give way rules.",
                          style: violationsStyle),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Speeding",
                                textAlign: TextAlign.left,
                                style: violationsStyle),
                          ],
                        ),
                      ),
                      const Text("Speeding is defined  as driving over the posted speed limit or at a speed that is inappropriate for the  driving conditions (e.g. rain, fog, traffic volume, traffic flow).  Speeding is not safe in any circumstance.",
                          style: violationsStyle),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Traffic Lights",
                                textAlign: TextAlign.left,
                                style: violationsStyle),
                          ],
                        ),
                      ),
                      const Text("You must not drive past the stop line on the road at a red traffic light or, if there is no stop line, the traffic light.",
                        style: violationsStyle),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}