import 'package:driver_app/MainScreens/main_screen.dart';
import 'package:driver_app/authentication/signup_screen.dart';
import 'package:driver_app/splashScreen/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 160,),

                const Text("LogIn Employee",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ) ,),

                const SizedBox(height: 100,),
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
                        fontSize: 20,
                      ),
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
                        fontSize: 20,
                      ),
                  ),

                ),

                const SizedBox(height: 80,),

                ElevatedButton(
                  onPressed: (){
                    validateForm();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                      shape: const StadiumBorder(),
                    padding: const EdgeInsets.all(15.0)
                  ),
                  child: const Text("Login Now",
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                    ),
                  ),
                ),

                const SizedBox(height: 10,),

                TextButton(
                    onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (c)=>SignUpScreen()));
                    },
                    child: const Text("New Users? Register Here",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16
                    ),))

                
              ],
            ),
          ),
        ),
      ),


    );
  }
}
