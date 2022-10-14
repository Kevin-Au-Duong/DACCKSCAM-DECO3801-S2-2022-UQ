import 'package:flutter/material.dart';

import '../Helper/globals.dart';
import '../Helper/store_item.dart';

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
      body: const StoreBody(), backgroundColor: Colors.black,
    );
  }
}

class StoreBody extends StatefulWidget {
  const StoreBody({super.key});

  @override
  State<StoreBody> createState() => _StoreBodyState();
}

class _StoreBodyState extends State<StoreBody> {
  // const StoreBody({super.key});
  StoreItem current = STORE[0];
  int points = totalPoints;
  int length = STORE.length;
  int pointer = 0;

  void _showDialog() {
    showDialog(
      context: context, barrierDismissible: false,
      builder: (BuildContext context) {
        if (totalPoints < current.price) {
          return AlertDialog(
            title: const Text("Insufficient Funds!"),
              // content: SingleChildScrollView(
              //   child: ListBody(
              //     children: const [
              //       Text('This is a Dialog Box. Click OK to Close.'),
              //     ],
              //   ),
              // ),
            actions: [
              ElevatedButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
        else {
          return AlertDialog(
            title: const Text("Are you sure?"),
            // content: SingleChildScrollView(
            //   child: ListBody(
            //     children: const [
            //       Text('This is a Dialog Box. Click OK to Close.'),
            //     ],
            //   ),
            // ),
            actions: [
              ElevatedButton(
                child: const Text('OK'),
                onPressed: () {
                  setState(() {
                    totalPoints -= current.price;
                    points = totalPoints;
                    vehicleImage = current.picturePath;
                    vehicleName = current.name;
                  });
                  Navigator.of(context).pop();
                },
              ),
              ElevatedButton(
                child: const Text('No thanks'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      alignment: Alignment.center,
      //height: 700,
      width: 500,
      decoration: const BoxDecoration(
          color: Colors.black,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SizedBox(
              height: 60,
              width: 480,
              child: Card(
                color: Colors.white10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Row(
                  children: [
                    const Spacer(),
                    const Text("Available DACKK\$: ", style: headings),
                    const Spacer(),
                    Text(points.toString(), style: headings),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
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
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              current.name,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Image(image: AssetImage(current.picturePath), fit: BoxFit.contain),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SizedBox(
              height: 60,
              width: 120,
              child: Card(
                color: Colors.white10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Row(
                  children: [
                    const Spacer(),
                    const Icon(Icons.car_rental_sharp, size: 30, color: Colors.deepPurpleAccent),
                    Text(current.price.toString(), style: headings),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SizedBox(
              height: 60,
              width: 280,
              child: Card(
                color: Colors.white10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Row(
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: leftArrow,
                      iconSize: 55,
                      onPressed: () {
                        setState(() {
                          if (pointer == 0) {
                            pointer = length - 1;
                            current = STORE[pointer];
                          }
                          else {
                            current = STORE[--pointer];
                          }
                        });
                      },
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: _showDialog,
                      child: const Text("Buy Now", style: headings),
                    ),
                    const Spacer(),
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: rightArrow,
                      iconSize: 55,
                      onPressed: () {
                        setState(() {
                          if (pointer < length - 1) {
                            current = STORE[++pointer];
                          }
                          else {
                            pointer = 0;
                            current = STORE[pointer];
                          }
                        });
                      },
                    ),
                  ],
                ),
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

