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
          padding: EdgeInsets.zero,
          icon: const Icon(Icons.home, size: 40),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, '/home', (_) => false);
          },
        ),
      ),
      // body: const Text("DAACKS"), backgroundColor: Colors.deepPurple,
      body: const SettingsBody(), backgroundColor: Colors.black,
    );
  }
}

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: Implement onPressed1 button.
    var onPressed1;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: const [
              Text(
                "Settings",
                style: TextStyle(fontSize: 30, color: Colors.white),
                textAlign: TextAlign.left,
              )
            ],
          ),
        ),
        Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          elevation: 20,
          margin: const EdgeInsets.all(10),
          color: Colors.grey,
          child: Row(children: [
            const Text("Account",
                style: TextStyle(fontSize: 20, color: Colors.white)),
            IconButton(
              onPressed: onPressed1,
              icon: const Icon(Icons.arrow_right_sharp),
              iconSize: 20,
              alignment: Alignment.centerRight,
            )
          ]),
          // child: Text(
          //   "Account",
          //   style: TextStyle(fontSize: 15, color: Colors.white)),
        ),

        Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          elevation: 20,
          margin: const EdgeInsets.all(10),
          color: Colors.grey,
          child: Row(children: [
            const Text("Notifications",
                style: TextStyle(fontSize: 20, color: Colors.white)),
            IconButton(
              onPressed: onPressed1,
              icon: const Icon(Icons.arrow_right_sharp),
              iconSize: 20,
              alignment: Alignment.centerRight,
            )
          ]),
        ),

        Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          elevation: 20,
          margin: const EdgeInsets.all(10),
          color: Colors.grey,
          child: Row(children: [
            const Text("Privacy",
                style: TextStyle(fontSize: 20, color: Colors.white)),
            IconButton(
              onPressed: onPressed1,
              icon: const Icon(Icons.arrow_right_sharp),
              iconSize: 20,
              alignment: Alignment.centerRight,
            )
          ]),
        ),

        Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          elevation: 20,
          margin: const EdgeInsets.all(10),
          color: Colors.grey,
          child: Row(children: [
            const Text("Support",
                style: TextStyle(fontSize: 20, color: Colors.white)),
            IconButton(
              onPressed: onPressed1,
              icon: const Icon(Icons.arrow_right_sharp),
              iconSize: 20,
              alignment: Alignment.centerRight,
            )
          ]),
        ),

        Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          elevation: 20,
          margin: const EdgeInsets.all(10),
          color: Colors.grey,
          child: Row(children: [
            const Text("About",
                style: TextStyle(fontSize: 20, color: Colors.white)),
            IconButton(
              onPressed: onPressed1,
              icon: const Icon(Icons.arrow_right_sharp),
              iconSize: 20,
              alignment: Alignment.centerRight,
            )
          ]),
        ),
      ]),
    );
    // return Center(child: Container(
    //   alignment: Alignment.center,
    //   height: 700,
    //   width: 500,
    //   decoration: const BoxDecoration(
    //       color: Colors.black,
    //       borderRadius: BorderRadius.only(
    //           topLeft: Radius.circular(50), topRight: Radius.circular(50)
    //       )
    //   ),
    //   child: Row(children: const [
    //     Text('Settings',
    //       style: TextStyle(fontSize: 30, color: Colors.white),
    //       textAlign: TextAlign.left,)
    //     ]),
    // child: const Text(
    //     "Settings",
    //     style: TextStyle(fontSize: 30, color: Colors.white)),
    // ),
    // );
  }
}
