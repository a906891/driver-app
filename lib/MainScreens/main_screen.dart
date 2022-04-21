import 'dart:convert';
import 'package:driver_app/tabPages/earning_tab.dart';
import 'package:driver_app/tabPages/home_switchoff.dart';
import 'package:driver_app/tabPages/profile_tab.dart';
import 'package:driver_app/tabPages/rating_tab.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../global/global.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  String? employeeName = "";
  String? employeeEmail = "";
  String? employeePhone = "";

  TabController? tabController;
  int selectedIndex = 0;

  onItemClicked(int index) {
    setState(() {
      selectedIndex = index;
      tabController!.index = selectedIndex;
    });
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    getEmployeeProfileDataFromFirebase();
    askpermission();
  }



  getEmployeeProfileDataFromFirebase() async {
    DatabaseReference driversRef = FirebaseDatabase.instance
        .ref()
        .child("drivers")
        .child(currentFirebaseUser!.uid);

    DatabaseEvent event = await driversRef.once();

    Map<String, dynamic> data = jsonDecode(jsonEncode(event.snapshot.value));

    setState(() async {

      employeeName = data['name'];
      employeeEmail = data['email'];
      employeePhone = data['phone'];

      //Data saved to phone
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('EmployeeName', employeeName!);
      prefs.setString('EmployeeEmail', employeeEmail!);
      prefs.setString('EmployeePhone', employeePhone!);

    });
  }


  askpermission() async {
    if (await Permission.location.serviceStatus.isEnabled) {
      // location is enabled
      Map<Permission, PermissionStatus> status1 = await [
        Permission.location,
      ].request();

      var status = await Permission.location.status;
      if (status.isGranted) {
        //location permission is given
      } else if (status.isDenied) {}
    } else {
      // permission is no enabled
      Map<Permission, PermissionStatus> status = await [
        Permission.location,
      ].request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: const [
          HomeSwitchOff(),
          EarningTabPage(),
          RatingTabPage(),
          ProfileTabPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.credit_card), label: "Earnings"),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_rate), label: "Ratings"),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.amber,
        backgroundColor: Colors.grey[100],
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontSize: 14),
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        onTap: onItemClicked,
      ),
    );
  }
}
