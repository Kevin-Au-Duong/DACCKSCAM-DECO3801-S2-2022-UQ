import 'package:flutter/material.dart';
import 'package:frontend/Helper/globals.dart' as globals;


class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        elevation: 0,
        title: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            //Navigator.pushNamedAndRemoveUntil(context, '/home', (_) => false);
          },
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
                    Navigator.pushNamed(context, '/settings');
                  },
                  tileColor: Colors.deepPurpleAccent,
                ),
              ],
            ),
          )
      ),
      // body: const Text("DAACKS"), backgroundColor: Colors.deepPurple,
      body: const HomeBody(), backgroundColor: Colors.deepPurple,
    );
  }

}

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});
  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {

  static String? name = globals.name;
  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      alignment: Alignment.center,
      height: 700,
      width: 500,
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50)
          )
      ),
      child: Text(
          "G'Day $name",
          style: const TextStyle(fontSize: 30, color: Colors.white)),
    ),
    );
  }
}


