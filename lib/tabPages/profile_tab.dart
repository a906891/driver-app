import 'package:driver_app/splashScreen/splash_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../global/global.dart';

class ProfileTabPage extends StatefulWidget {
  const ProfileTabPage({Key? key}) : super(key: key);

  @override
  State<ProfileTabPage> createState() => _ProfileTabPageState();
}


class _ProfileTabPageState extends State<ProfileTabPage> {

  String? employeeName = "";
  String? employeeEmail = "";
  String? employeePhone = "";

  @override
  void initState() {
    super.initState();
    getEmployeeDataFromPhone();
  }

  getEmployeeDataFromPhone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      employeeName = prefs.getString('EmployeeName');
      employeeEmail = prefs.getString('EmployeeEmail');
      employeePhone = prefs.getString('EmployeePhone');
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
                "Name: $employeeName",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 50.0,
              ),

              Text(
                "Email: $employeeEmail",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 50.0,
              ),
              Text(
                "Phone: $employeePhone",
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
