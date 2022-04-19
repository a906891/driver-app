import 'dart:async';

import 'package:driver_app/MainScreens/main_screen.dart';
import 'package:driver_app/authentication/login_screen.dart';
import 'package:driver_app/authentication/signup_screen.dart';
import 'package:flutter/material.dart';

import '../global/global.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {

  startTimer(){
    Timer(const Duration(seconds: 2) , () async {

      //Checks if the user is logged in first
      if(await fAuth.currentUser != null)
        {
          currentFirebaseUser = fAuth.currentUser;
          Navigator.push(context, MaterialPageRoute(builder: (c)=> MainScreen()));
        }
      else{
        // send user to home screen
        Navigator.push(context, MaterialPageRoute(builder: (c)=> LoginScreen()));
      }

    });
  }

  // starts the timer automatically
  @override
  void initState() {

    super.initState();
     startTimer();
  }

  @override
  Widget build(BuildContext context)
  {
    return Material(
      child: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/logo1.png"),

            SizedBox(height: 10,),
            
            const Text(
              "Driver App Clone",
              style: TextStyle(fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold),
            )
          ],
        )
      ),
    );
  }
}
