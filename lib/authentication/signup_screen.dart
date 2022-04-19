import 'package:driver_app/authentication/car_info_screen.dart';
import 'package:driver_app/authentication/login_screen.dart';
import 'package:driver_app/widgets/progress_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  ValidateForm(){
    if(nametextEditingController.text.length < 3){
      Fluttertoast.showToast(msg: "Name must be atleast 3 characters");
    }
    else if(!emailtextEditingController.text.contains("@")){
      Fluttertoast.showToast(msg: "Email is not valid");
    }
    else if(phonetextEditingController.text.isEmpty ){
      Fluttertoast.showToast(msg: "Phone number is required");
    }
    else if(passwordtextEditingController.text.length < 6 ){
      Fluttertoast.showToast(msg: "Password must be atleast 6 characters");
    }
    else{


      showDialog(context: context, builder: (BuildContext c){
        return ProgressDialog(message: "Processing, Please wait",);
      }, barrierDismissible: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Image.asset("images/logo1.png"),
              ),

              const SizedBox(height: 10,),

              const Text("Register as a driver",
              style: TextStyle(
                fontSize: 26,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ) ,),
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
                    fontSize: 15,
                  ),
                  labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 10
                  )
                ),

              ),

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

              const SizedBox(height: 10,),
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
                      fontSize: 15,
                    ),
                    labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 10
                    )
                ),

              ),

              const SizedBox(height: 10,),
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
                    ValidateForm();
                  },
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightGreenAccent,
                  shape: const StadiumBorder(),
                ),

                  child: const Text("Create Account",
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
