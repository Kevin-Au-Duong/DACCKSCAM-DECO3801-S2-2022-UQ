import 'package:flutter/material.dart';

import '../Helper/globals.dart';

class Store extends StatelessWidget {
  const Store({super.key});

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
      body: const StoreBody(), backgroundColor: Colors.deepPurple,
    );
  }
}

class StoreBody extends StatelessWidget {
  const StoreBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      alignment: Alignment.center,
      height: 700,
      width: 500,
      decoration: const BoxDecoration(
          color: Colors.black,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: SizedBox(
              height: 60,
              width: 360,
              child: Card(
                color: Colors.white10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Row(
                  children: [
                    const Spacer(),
                    const Text("Available funds: ", style: headings),
                    const Spacer(),
                    Text("\$$points", style: headings),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 274,
            width: 360,
            child: Card(
              color: Colors.white10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: InkWell(
                splashColor: Colors.purple,
                borderRadius: BorderRadius.circular(30.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "$vehicleName",
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
          const Spacer(),
          SizedBox(
            height: 60,
            width: 120,
            child: Card(
              color: Colors.white10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                children: const [
                  Spacer(),
                  Text("\$15", style: headings),
                  Spacer(),
                ],
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 60,
            width: 270,
            child: Card(
              color: Colors.white10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                children: const [
                  Spacer(),
                  Text("Buy Now", style: headings),
                  Spacer(),
                ],
              ),
            ),
          ),
          const Spacer(),
        ]
      )
      // child: const Text(
      //     "Store",
      //     style: headings),
    ),
    );
  }
}