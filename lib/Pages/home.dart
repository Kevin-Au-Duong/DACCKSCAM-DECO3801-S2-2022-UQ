import 'package:flutter/material.dart';
import 'package:frontend/Helper/globals.dart' as globals;
import 'package:frontend/Helper/read_drive_data.dart';
import 'package:frontend/Pages/violations.dart';
import 'package:frontend/Pages/leaderboard.dart';

import '../Helper/globals.dart';

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
          //return Future<void>.delayed(const Duration(seconds: 1));
        },

        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        "G'day $name,",
                        style: const TextStyle(fontSize: 30, color: Colors.white),
                        textAlign: TextAlign.left,
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

                                      Text(
                                        TRIPS[CURRENTTRIP].numViolations.toString(),
                                        style: const TextStyle(fontSize: 70, color: Colors.white) ,
                                      ),
                                      const Text(
                                        'Last Drive',
                                        style: TextStyle(fontSize: 18, color: Colors.white) ,
                                      )
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
                                      style: const TextStyle(fontSize: 70, color: Colors.white) ,
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
                  padding: const EdgeInsets.only(top: 16),
                  child: SizedBox(
                    height: 301,
                    width: 400,
                    child: Card(
                      color: Colors.white10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: InkWell(
                        splashColor: Colors.purple,
                        borderRadius: BorderRadius.circular(30.0),
                        onTap:() {
                          //TODO: Go to rule violations page
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
                )
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