import 'package:driver_app/main.dart';
import 'package:driver_app/tabPages/home_tab.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import '../global/global.dart';

class HomeSwitchOff extends StatefulWidget {
  const HomeSwitchOff({Key? key}) : super(key: key);

  @override
  State<HomeSwitchOff> createState() => _HomeSwitchOffState();
}


class _HomeSwitchOffState extends State<HomeSwitchOff> {
  String s = "Here is the data";

  @override
  initState() {
    super.initState();

  }

  getlocation(){

  }

  DatabaseReference driversRef = FirebaseDatabase.instance.ref().child("drivers").child(currentFirebaseUser!.uid).child("location_details");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (c) => const HomeTabPage()));
                },
                child: const Text("Switch On")),
            ElevatedButton(onPressed: () {}, child: const Text("Get Data")),

            Flexible(
                child: FirebaseAnimatedList(
                  shrinkWrap: true,
                    query: driversRef,
                    itemBuilder: (BuildContext context, DataSnapshot snapshot,
                        Animation<double> animation, int index) {
                      return Text(snapshot.value.toString(),
                      style: const TextStyle(
                        fontSize:16.0,
                        color: Colors.black
                      ),);
                    })),
          ],
        ),
      ),
    );
  }
}
