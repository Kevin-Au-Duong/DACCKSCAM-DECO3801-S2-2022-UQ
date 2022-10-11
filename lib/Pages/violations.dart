import 'package:flutter/material.dart';

import '../Helper/globals.dart';
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
    child: Text("Violations",
        textAlign: TextAlign.left,
        style: headings),
  );
  List<Widget> lines = [];
  lines.add(title);
  Column violationContainer;

  for (Violation violation in violations) {
    var name = violation.name;
    var timestamp = violation.timestamp;
    var severity = violation.severity;
    violationContainer = Column(
      children: [
        Text(name,
          textAlign: TextAlign.left,
          style: headings),
        Text(timestamp,
          textAlign: TextAlign.left,
          style: headings),
        Text(severity.toString(),
          textAlign: TextAlign.left,
          style: headings),
      ]
    );
    //violationContainer.children.add(Text(name));
    //violationContainer.children.add(Text(timestamp));
    //violationContainer.children.add(Text(severity.toString()));

    lines.add(violationContainer);
    // lines.add(const Text("Cunt",
    //     textAlign: TextAlign.left,
    //     style: TextStyle(fontSize: 30, color: Colors.white)),
    // );
  }
  return lines;
}
