import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DACCKS CAM',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        // title: const Text("DACCKS CAM"),
        title: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            print("abcd");
          },
          padding: const EdgeInsets.fromLTRB(125, 0, 0, 0),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.deepPurple,
        // child: Text("DACCKS CAM")
        child: Container(
          padding: const EdgeInsets.all(15),
          child: const Text("DACCKS CAM", style: TextStyle(fontSize: 30)),
        ),
      ),
      // body: const Text("Daccks"), backgroundColor: Colors.deepPurple,
      body: const AppBody(), backgroundColor: Colors.deepPurple,
    );
  }
}

class AppBody extends StatelessWidget {
  const AppBody({super.key});

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
      child: const Text(
          "G'Day Ben",
          style: TextStyle(fontSize: 30, color: Colors.white)),
    ),
    );
  }
}
