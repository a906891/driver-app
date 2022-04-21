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

  bool pressed = false;
  String switchState = "Switched Off";
  String buttonText = "CLICK HERE TO START WORKING";
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

  changetext(){
    String? s;
    String? bs;

    if(pressed)
      {
        pressed = false;
        s = "Switched Off ";
        bs= "CLICK HERE TO START WORKING";
      }
    else if(!pressed){
      pressed = true;
      s = "Switched ON";
      bs= "CLICK HERE TO STOP WORKING";
    }

    setState(() {
      switchState = s!;
      buttonText = bs!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(switchState,
          style: pressed
              ? const TextStyle(color: Colors.green,fontSize: 27)
              : const TextStyle(color:Colors.red,fontSize: 27),
            ),

            const SizedBox(height: 50.0,),

            ElevatedButton(
                onPressed: () {
                  changetext();
                  Navigator.push(context, MaterialPageRoute(builder: (c) => const HomeTabPage()));
                },
                style: ElevatedButton.styleFrom(

                  primary: Colors.black,
                  padding: const EdgeInsets.fromLTRB(40.0,20.0,40.0,20.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // <-- Radius
                  ),
                ),
                child: Text(buttonText,
                style: const TextStyle(
                  fontSize: 15.0
                ),)),

            const SizedBox(height: 50.0,),

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
