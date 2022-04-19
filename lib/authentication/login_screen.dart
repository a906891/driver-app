import 'package:driver_app/MainScreens/main_screen.dart';
import 'package:driver_app/authentication/signup_screen.dart';
import 'package:driver_app/splashScreen/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../global/global.dart';
import '../widgets/progress_dialog.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailtextEditingController = TextEditingController();
  TextEditingController passwordtextEditingController = TextEditingController();

  validateForm() {
    if (!emailtextEditingController.text.contains("@")) {
      Fluttertoast.showToast(msg: "Email is not valid");
    }
    else if (passwordtextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Password is required");
    }
    else{
        LogInNow();
    }
  }

  LogInNow() async{
    showDialog(context: context, builder: (BuildContext c){
      return ProgressDialog(message: "Processing, Please wait",);
    }, barrierDismissible: false);

// Creates a user on the  firebase
    final User? firebaseUser = (
        await fAuth.signInWithEmailAndPassword(
          email: emailtextEditingController.text.trim(),
          password: passwordtextEditingController.text.trim(),
        ).catchError((msg){
          Navigator.pop(context);
          Fluttertoast.showToast(msg: "Error: " + msg.toString());
        })
    ).user;

// getting data to be saved after creating user
    if(firebaseUser != null){

      currentFirebaseUser = firebaseUser;
      Fluttertoast.showToast(msg: "Login Successful");
      Navigator.push(context, MaterialPageRoute(builder: (c)=>const MySplashScreen()));

    }
    else{
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Error Occurred during Login");
    }

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 20,),
//image
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Image.asset("images/logo1.png"),
              ),

              const SizedBox(height: 10,),

              const Text("Login as a driver",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ) ,),

              const SizedBox(height: 10,),
//Email
              TextField(
                controller: emailtextEditingController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                  color: Colors.grey,
                ),
                decoration: const InputDecoration(
                    hintText: "Email",

                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),

                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                    labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 10
                    )
                ),

              ),

              const SizedBox(height: 27,),

              TextField(
                controller: passwordtextEditingController,
                keyboardType: TextInputType.text,
                obscureText: true,
                style: const TextStyle(
                  color: Colors.grey,
                ),
                decoration: const InputDecoration(
                    hintText: "Password",

                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),

                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                    labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 10
                    )
                ),

              ),

              const SizedBox(height: 30,),

              ElevatedButton(
                onPressed: (){
                  validateForm();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightGreenAccent,
                ),
                child: const Text("Login",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                  ),
                ),
              ),

              const SizedBox(height: 10,),

              TextButton(
                  onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (c)=>SignUpScreen()));
                  },
                  child: const Text("Register Here",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16
                  ),))

              
            ],
          ),
        ),
      ),


    );
  }
}
