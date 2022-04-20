import 'package:driver_app/tabPages/home_tab.dart';
import 'package:flutter/material.dart';

class HomeSwitchOff extends StatefulWidget {
  const HomeSwitchOff({Key? key}) : super(key: key);

  @override
  State<HomeSwitchOff> createState() => _HomeSwitchOffState();
}

class _HomeSwitchOffState extends State<HomeSwitchOff> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (c)=>HomeTabPage()));
        }, child: Text("Switch On")),
      ),
    );
  }
}
