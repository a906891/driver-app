import 'dart:convert';
import 'package:driver_app/tabPages/home_tab.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../global/global.dart';
import 'package:location/location.dart';

class HomeSwitchOff extends StatefulWidget {
  const HomeSwitchOff({Key? key}) : super(key: key);

  @override
  State<HomeSwitchOff> createState() => _HomeSwitchOffState();
}


class _HomeSwitchOffState extends State<HomeSwitchOff> {

  String oldlatitude = "0";
  String oldlongitude = "0";

  DatabaseReference driversRef = FirebaseDatabase.instance.ref().child("drivers").
  child(currentFirebaseUser!.uid).child("location_details");

  getlocation() async {

    // once
    DatabaseEvent event = await driversRef.once();
    print(event.snapshot.value);

    Map<String,dynamic> data = jsonDecode(jsonEncode(event.snapshot.value));

    setState(() {
      oldlatitude = data['latitude'].toString();
      oldlongitude = data['longitude'].toString();
    });
    Fluttertoast.showToast(msg: "data collected");


  }




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
            ElevatedButton(onPressed: () {
                getlocation();
            }, child: Text("Get Data from firebase")),

            Text("Old Latitude was $oldlatitude"),
            Text("Old Latitude was $oldlongitude"),




          ],
        ),
      ),
    );
  }
}
