import 'dart:convert';

import 'package:driver_app/splashScreen/splash_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../global/global.dart';

class ProfileTabPage extends StatefulWidget {
  const ProfileTabPage({Key? key}) : super(key: key);

  @override
  State<ProfileTabPage> createState() => _ProfileTabPageState();
}


class _ProfileTabPageState extends State<ProfileTabPage> {
  String? adminName = "";
  String? adminOccupation = "";
  String? adminEmail = "";
  String? adminPhone = "";


  @override
  void initState() {
    super.initState();
    getEmployeeProfileData();
  }

  getEmployeeProfileData() async {
    DatabaseReference driversRef = FirebaseDatabase.instance.ref().child("drivers").
    child(currentFirebaseUser!.uid);

    DatabaseEvent event = await driversRef.once();

    Map<String,dynamic> data = jsonDecode(jsonEncode(event.snapshot.value));

    setState(() {
      adminName = data['name'];
      adminOccupation = data[''];
      adminEmail = data['email'];
      adminPhone = data['phone'];
    });

  }




  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [

            CircleAvatar(
              backgroundImage: AssetImage('images/staff.png'),
              radius: 70,
              backgroundColor: Colors.black,
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(40.0, 0, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 90.0,
              ),
              Text(
                "Name: $adminName",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 50.0,
              ),

              Text(
                "Email: $adminEmail",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 50.0,
              ),
              Text(
                "Phone: $adminPhone",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 80.0,
              ),
            ],
          ),
        ),


        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("Sign out"),
              onPressed: () {
                fAuth.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (c) => const MySplashScreen()));
              },
              style: ElevatedButton.styleFrom(

                primary: Colors.black,
                padding: const EdgeInsets.fromLTRB(40.0,20.0,40.0,20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // <-- Radius
                ),
              ),
            ),
          ],
        ),

      ],
    );
  }
}
