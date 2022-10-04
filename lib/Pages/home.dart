import 'package:flutter/material.dart';
import 'package:frontend/Helper/globals.dart' as globals;
final _scaffoldKey = GlobalKey<ScaffoldState>();


class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
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
                ListTile(
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
  int numViolations = globals.violations.length;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20),
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
                    height: 150,
                    width: 150,
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
                          print("Tapped rule violations card");
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '$numViolations',
                                  style: const TextStyle(fontSize: 80, color: Colors.white) ,
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
              )
            ],
          )
        ],
      ),
    );
  }
}


