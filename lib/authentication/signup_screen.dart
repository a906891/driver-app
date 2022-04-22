import 'package:driver_app/MainScreens/main_screen.dart';
import 'package:driver_app/authentication/car_info_screen.dart';
import 'package:driver_app/authentication/login_screen.dart';
import 'package:driver_app/widgets/progress_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../global/global.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController nametextEditingController = TextEditingController();
  TextEditingController emailtextEditingController = TextEditingController();
  TextEditingController phonetextEditingController = TextEditingController();
  TextEditingController passwordtextEditingController = TextEditingController();

  //form check
  validateForm() {
    if (nametextEditingController.text.length < 3) {
      Fluttertoast.showToast(msg: "Name must be atleast 3 characters");
    }
    else if (!emailtextEditingController.text.contains("@")) {
      Fluttertoast.showToast(msg: "Email is not valid");
    }
    else if (phonetextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Phone number is required");
    }
    else if (passwordtextEditingController.text.length < 6) {
      Fluttertoast.showToast(msg: "Password must be atleast 6 characters");
    }
    else{
      saveDriverInfoNow();
    }
  }

  saveDriverInfoNow() async{
      showDialog(context: context, builder: (BuildContext c){
        return ProgressDialog(message: "Processing, Please wait",);
      }, barrierDismissible: false);

// Creates a user on the  firebase
      final User? firebaseUser = (
          await fAuth.createUserWithEmailAndPassword(
              email: emailtextEditingController.text.trim(),
            password: passwordtextEditingController.text.trim(),
          ).catchError((msg){
            Navigator.pop(context);
            Fluttertoast.showToast(msg: "Error: " + msg.toString());
          })
      ).user;

// getting data to be saved after creating user
      if(firebaseUser != null){
        Map driversMap = {
          "id": firebaseUser.uid,
          "name": nametextEditingController.text.trim(),
          "email": emailtextEditingController.text.trim(),
          "phone": phonetextEditingController.text.trim()
        };
// putting data in Real Time database
        DatabaseReference driversRef = FirebaseDatabase.instance.ref().child("drivers");
        driversRef.child(firebaseUser.uid).set(driversMap);

        currentFirebaseUser = firebaseUser;
        Fluttertoast.showToast(msg: "Account has been created");
        Navigator.push(context, MaterialPageRoute(builder: (c)=> const MainScreen()));

      }
      else{
        Navigator.pop(context);
        Fluttertoast.showToast(msg: "Account has not been Created");
      }

    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 150,),


              const Text("Register Employee",
              style: TextStyle(
                fontSize: 30,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ) ,),

              const SizedBox(height: 60,),
//Name
              TextField(
                controller: nametextEditingController,
                style: const TextStyle(
                  color: Colors.grey,
                ),
                decoration: const InputDecoration(
                  hintText: "Name",
                  
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

              const SizedBox(height: 15,),
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

              const SizedBox(height: 15,),
//Phone
              TextField(
                controller: phonetextEditingController,
                keyboardType: TextInputType.phone,
                style: const TextStyle(
                  color: Colors.grey,
                ),
                decoration: const InputDecoration(
                    hintText: "Phone",

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

              const SizedBox(height: 15,),
//Password
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

              const SizedBox(height: 50,),

              ElevatedButton(
                  onPressed: (){
                    validateForm();
                  },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.all(15.0)
                ),

                  child: const Text("Register Now",
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
                    Navigator.push(context,MaterialPageRoute(builder: (c)=>LoginScreen()));
                  },
                  child: const Text("Already Registered? Login Here",
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
