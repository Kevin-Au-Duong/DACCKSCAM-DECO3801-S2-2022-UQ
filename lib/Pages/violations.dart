
import 'package:flutter/material.dart';

import '../Helper/globals.dart';
import '../Helper/trip.dart';
import '../Helper/violation.dart';

class Violations extends StatelessWidget {
  const Violations({super.key});

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
      body: const ViolationsBody(), backgroundColor: Colors.deepPurple,
    );
  }
}

class ViolationsBody extends StatefulWidget {
  const ViolationsBody({super.key});
  @override
  State<ViolationsBody> createState() => _ViolationsBodyState();
}

class _ViolationsBodyState extends State<ViolationsBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: 700,
        width: 500,
        decoration: const BoxDecoration(
          color: Colors.black,
          ),
      child: Column(
        children: buildRowList(),
      )
      ),
    );
  }
}

List<Widget> buildRowList() {
  var title = const Padding(
    padding: EdgeInsets.all(15.0),
    child: Text("Rule Violations",
        textAlign: TextAlign.left,
        style: headings),
  );
  List<Widget> lines = [];
  lines.add(title);
  Padding violationContainer;

  for (Violation violation in TRIPS[CURRENTTRIP].violationList) {
    var name = violation.name;
    var severity = violation.severity;
    var penalty = violation.penalty;
    var occurrences = violation.occurrences;
    violationContainer = Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Rule Violation: ",
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
                  const Text("Severity: ",
                      textAlign: TextAlign.left,
                      style: violationsStyle),
                  Text(severity,
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
                  const Text("Penalty: ",
                      textAlign: TextAlign.left,
                      style: violationsStyle),
                  Text(penalty.toString(),
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 20, color: Colors.red)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Occurences: ",
                      textAlign: TextAlign.left,
                      style: violationsStyle),
                  Text(occurrences.toString(),
                      textAlign: TextAlign.left,
                      style: const TextStyle(fontSize: 20, color: Colors.red)),
                ],
              ),
            ),
          ]
        ),
      ),
    );
    //violationContainer.children.add(Text(name));
    //violationContainer.children.add(Text(timestamp));
    //violationContainer.children.add(Text(severity.toString()));

    lines.add(violationContainer);
    //lines.add(const Text("Cunt",
         //textAlign: TextAlign.left,
         //style: TextStyle(fontSize: 30, color: Colors.white)),
    //);
  }
  return lines;
}
