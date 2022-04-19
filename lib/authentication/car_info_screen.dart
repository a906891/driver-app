import 'package:driver_app/authentication/login_screen.dart';
import 'package:driver_app/global/global.dart';
import 'package:driver_app/splashScreen/splash_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CarInfoScreen extends StatefulWidget {

  @override
  State<CarInfoScreen> createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {

  TextEditingController carModeltextEditingController = TextEditingController();
  TextEditingController carNumbertextEditingController = TextEditingController();
  TextEditingController carColortextEditingController = TextEditingController();

  List<String> carTypesList = ["uber-x", "uber-go" , "bike"];
  String? selectedCarType;

  // save car info by making a child of main driverMap
  saveCarInfo(){
    Map driverCarInfoMap = {
      "car_color": carColortextEditingController.text.trim(),
      "car_number": carNumbertextEditingController.text.trim(),
      "car_model": carModeltextEditingController.text.trim(),
      "type": selectedCarType,
    };

    DatabaseReference driversRef = FirebaseDatabase.instance.ref().child("drivers");
    driversRef.child(currentFirebaseUser!.uid).child("car_details").set(driverCarInfoMap);

    Fluttertoast.showToast(msg: "Car details has been saved");
    Navigator.push(context, MaterialPageRoute(builder: (c)=> const MySplashScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 24,),

              Padding(padding: const EdgeInsets.all(20.0),
              child: Image.asset("images/logo1.png")),

              const SizedBox(height: 10,),

              const Text("Car Details",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ) ,),
//Car Model
              TextField(
                controller: carModeltextEditingController,
                style: const TextStyle(
                  color: Colors.grey,
                ),
                decoration: const InputDecoration(
                    hintText: "Car Model",

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
//Car Number
              TextField(
                controller: carNumbertextEditingController,

                style: const TextStyle(
                  color: Colors.grey,
                ),
                decoration: const InputDecoration(
                    hintText: "Car Number",

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
                controller: carColortextEditingController,

                style: const TextStyle(
                  color: Colors.grey,
                ),
                decoration: const InputDecoration(
                    hintText: "Car Color",

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

              const SizedBox(height:  20,),

              DropdownButton(
                iconSize: 20,
                dropdownColor: Colors.black,
                hint: const Text("Please choose vehicle type",
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey
                ),),

                  value: selectedCarType,
                  onChanged: (newValue)
              {
                setState(() {
                  selectedCarType = newValue.toString();
                });
              },
                items: carTypesList.map((car){
                  return DropdownMenuItem(
                    child:  Text(car, style: const TextStyle(color: Colors.grey),),
                    value: car,
                  );
                }).toList()
              ),

              const SizedBox(height: 30,),

              ElevatedButton(
                onPressed: (){
                  if(carColortextEditingController.text.isNotEmpty
                      && carNumbertextEditingController.text.isNotEmpty
                      && carModeltextEditingController.text.isNotEmpty && selectedCarType != null){
                    saveCarInfo();
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightGreenAccent,
                ),
                child: const Text("Save Now",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                  ),
                ),
              )
              
            ],
          ),
        )
      ),
    );
  }
}
