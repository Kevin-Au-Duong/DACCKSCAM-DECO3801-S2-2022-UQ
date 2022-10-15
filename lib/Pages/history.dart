import 'package:flutter/material.dart';

import '../Helper/globals.dart';
import '../Helper/trip.dart';
import '../Templates/stateful_page_template.dart';

class History extends StatelessWidget {
  const History({super.key});

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
      body: const HistoryBody(), backgroundColor: Colors.black,
    );
  }
}

class HistoryBody extends StatefulWidget {
  const HistoryBody({super.key});
  @override
  State<HistoryBody> createState() => _HistoryBodyState();
}

class _HistoryBodyState extends State<HistoryBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          alignment: Alignment.center,
          //height: 700,
          width: 500,
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: ListView(
            children: buildRowList(context),
          )
      ),
    );
  }
}

List<Widget> buildRowList(BuildContext context) {
  var title = const Padding(
    padding: EdgeInsets.all(15.0),
    child: Text("Driving History",
        textAlign: TextAlign.left,
        style: headings),
  );
  List<Widget> lines = [];
  lines.add(title);
  Padding violationContainer;
  if (TRIPS.isEmpty) {
    lines.add(const Text("You currently have no recorded driving trips. Start driving to get more driving data",
        style: violationsStyle));
  }

  for (Trip trip in TRIPS) {
    var name = trip.name;
    var tripNumber = trip.tripNum;
    var startTime = trip.startTime;
    var endTime = trip.endTime;
    var distance = (trip.distance / 1000).toStringAsFixed(2);
    var duration = trip.duration.split(".")[0];
    var numViolations = trip.numViolations;
    var totalTripPenalty = trip.totalTripPenalty;
    violationContainer = Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: InkWell(
          onTap: () {
            CURRENTTRIP = tripNumber;
            Navigator.pop(context);
            Navigator.pushNamed(context, '/violations');
          },
          child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Trip name: ",
                          textAlign: TextAlign.left,
                          style: violationsStyle),
                      Text(name,
                          textAlign: TextAlign.left,
                          style: violationsStyle),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Start time: ",
                          textAlign: TextAlign.left,
                          style: violationsStyle),
                      Text(startTime,
                          textAlign: TextAlign.left,
                          style: violationsStyle),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("End time: ",
                          textAlign: TextAlign.left,
                          style: violationsStyle),
                      Text(endTime,
                          textAlign: TextAlign.left,
                          style: violationsStyle),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Duration: ",
                          textAlign: TextAlign.left,
                          style: violationsStyle),
                      Text(duration,
                          textAlign: TextAlign.left,
                          style: violationsStyle),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Distance travelled (km): ",
                          textAlign: TextAlign.left,
                          style: violationsStyle),
                      Text(distance,
                          textAlign: TextAlign.left,
                          style: violationsStyle),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Number of violations: ",
                          textAlign: TextAlign.left,
                          style: violationsStyle
                      ),
                      if (numViolations == 0) ...[
                        Text(numViolations.toString(),
                            textAlign: TextAlign.left,
                            style: noViolationsStyle,
                        ),
                      ] else if (numViolations > 0) ...[
                        Text(numViolations.toString(),
                            textAlign: TextAlign.left,
                            style: hasViolationsStyle
                        ),
                      ]
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Penalty: ",
                          textAlign: TextAlign.left,
                          style: violationsStyle
                      ),
                      if (totalTripPenalty == 0) ...[
                        Text(totalTripPenalty.toString(),
                          textAlign: TextAlign.left,
                          style: noViolationsStyle,
                        ),
                      ] else if (totalTripPenalty > 0) ...[
                        Text(totalTripPenalty.toString(),
                            textAlign: TextAlign.left,
                            style: hasViolationsStyle
                        ),
                      ]
                    ],
                  ),
                ),
              ]
          ),
        ),
      ),
    );
    lines.add(violationContainer);
  }
  return lines;
}
