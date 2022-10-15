import 'package:flutter/material.dart';
import 'package:frontend/Helper/globals.dart' as globals;
import 'package:frontend/Helper/read_drive_data.dart';
import 'package:frontend/Pages/history.dart';
import 'package:frontend/Pages/violations.dart';
import 'package:frontend/Pages/leaderboard.dart';

import '../Helper/globals.dart';
import '../Helper/trip.dart';

final _scaffoldKey = GlobalKey<ScaffoldState>();


class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    DriveData defaultData = DriveData('default');
    defaultData.parse();
    CURRENTTRIP = TRIPS.length - 1;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        //elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, size: 40), // change this size and style
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
        title: const Text(
            'Home',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            )
        ),
      ),
      drawer: Drawer(
          backgroundColor: Colors.deepPurple,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const SizedBox(
                  height: 100,
                  child: DrawerHeader(
                    child: Text(
                        'Menu',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    title: const Text(
                      'Settings',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/settings');
                    },
                    tileColor: Colors.deepPurpleAccent,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    title: const Text(
                      'Driving History',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const History(),
                        ),
                      );

                    },
                    tileColor: Colors.deepPurpleAccent,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    title: const Text(
                      'Store',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/store');
                    },
                    tileColor: Colors.deepPurpleAccent,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    title: const Text(
                      'Log Out',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
                    },
                    tileColor: Colors.deepPurpleAccent,
                  ),
                ),
              ],
            ),
          )
      ),
      // body: const Text("DAACKS"), backgroundColor: Colors.deepPurple,
      body: const HomeBody(), backgroundColor: Colors.black,
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {

  String? name = globals.name;
  int leaderboardPercentile = globals.leaderboardPercentile;
  String? vehicleName = globals.vehicleName;
  String vehicleImage = globals.vehicleImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: RefreshIndicator(
        onRefresh: () async {
          await _refreshData();
          setState(() {});
        },

        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "G'day $name,",
                        style: const TextStyle(fontSize: 30, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Rule Violations',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        SizedBox(
                          height: 180,
                          width: 180,
                          child: Card(
                              color: Colors.white10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: InkWell(
                                splashColor: Colors.purple,
                                borderRadius: BorderRadius.circular(30.0),
                                onTap:() async {
                                  /// Read data everytime last drive's rule violations
                                  /// is visited
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Violations(),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Column(

                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: const [
                                          Icon(Icons.chevron_right, color: Colors.white54, size: 32,),
                                        ],
                                      ),


                                      if (CURRENTTRIP == -1) ...[
                                        const Text(
                                          '0',
                                          style: TextStyle(fontSize: 70, color: Colors.white) ,
                                        ),
                                      ] else ...[
                                        Text(
                                          TRIPS[CURRENTTRIP].numViolations.toString(),
                                          style: const TextStyle(fontSize: 65, color: Colors.white) ,
                                        ),
                                      ],
                                      const Text(
                                        'Last Drive',
                                        style: TextStyle(fontSize: 18, color: Colors.white) ,
                                      ),

                                    ],
                                  ),
                                ),
                              )
                          ),
                        )
                      ],
                    ), // Rule violations column
                    const Spacer(),
                    Column(
                      children: [
                        const Text(
                          'Leaderboard',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        SizedBox(
                          height: 180,
                          width: 180,
                          child: Card(
                            color: Colors.white10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: InkWell(
                              splashColor: Colors.purple,
                              borderRadius: BorderRadius.circular(30.0),
                              onTap:() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Leaderboard(),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(left: 16.0),
                                          child: Text(
                                            'Top',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(color: Colors.white, fontSize: 18),
                                          ),
                                        ),
                                        Spacer(),
                                        Icon(Icons.chevron_right, color: Colors.white54, size: 32,),
                                      ],
                                    ),
                                    Text(
                                      '$leaderboardPercentile%',
                                      style: const TextStyle(fontSize: 65, color: Colors.white) ,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 16.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: const [
                                          Text(
                                            'Of Drivers',
                                            style: TextStyle(fontSize: 18, color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ), // Leaderboard column
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: SizedBox(
                    height: 361,
                    width: 480,
                    child: Card(
                      color: Colors.white10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: InkWell(
                        splashColor: Colors.purple,
                        borderRadius: BorderRadius.circular(30.0),
                        onTap:() {
                          Navigator.pushNamed(context, '/store');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "$name's $vehicleName",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Image(image: AssetImage(vehicleImage), fit: BoxFit.contain),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SizedBox(
                    height: 350,
                    width: 480,
                    child: Card(
                      color: Colors.white10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: InkWell(
                        splashColor: Colors.purple,
                        borderRadius: BorderRadius.circular(30.0),
                        onTap:() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const History(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16.0, 8, 16, 8),
                          child: Column(
                            children: recentDrives(),
                          ),
                        )
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _refreshData() async {
    DriveData defaultData = DriveData('default');
    //Future<String> lines = defaultData.parse();
    await defaultData.parse();
    CURRENTTRIP = TRIPS.length - 1;
  }
}

List<Widget> recentDrives() {
  List<Widget> lines = [];
  lines.add(
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Text(
          "Your Recent Trips",
          style: homeStyle,
        ),
      ],
    ),
  );
  if (TRIPS.isEmpty) {
    lines.add(
      const Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Text("No recent trips recorded. Make sure you record your trips to earn more DACKS\$ and track your progress!",
        style: homeStyle),
      )
    );
  }
  else {
    var actualTrips = TRIPS;
    if (actualTrips.length > 3) {
      actualTrips = actualTrips.sublist(actualTrips.length - 3);
    }
    for (Trip trip in actualTrips) {
      var date = trip.startTime.split(" ")[0];
      var distance = (trip.distance / 1000).toStringAsFixed(2);
      var duration = trip.duration.split(".")[0];
      var violations = trip.numViolations;
      TextStyle style;
      if (violations == 0) {
        style = noViolationsStyle;
      }
      else {
        style = hasViolationsStyle;
      }

      var row =
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white30,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 0, 12, 0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text("Trip date:", style: homeStyle),
                    const Spacer(),
                    Text(date, style: homeStyle),
                  ],
                ),
                Row(
                  children: [
                    const Text("Drive duration: ", style: homeStyle),
                    const Spacer(),
                    Text(duration, style: homeStyle),
                  ],
                ),
                Row(
                  children: [
                    const Text("Drive distance (km): ", style: homeStyle),
                    const Spacer(),
                    Text(distance, style: homeStyle),
                  ],
                ),
                Row(
                  children: [
                    const Text("Violations:", style: homeStyle),
                    const Spacer(),
                    Text(violations.toString(), style: style),
                  ],
                ),
              ],
            ),
          )
        ),
      );
      lines.add(row);
    }
  }
  return lines;
}