import 'dart:async';
import 'package:driver_app/MainScreens/main_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../global/global.dart';

class HomeTabPage extends StatefulWidget {
  const HomeTabPage({Key? key}) : super(key: key);

  @override
  State<HomeTabPage> createState() => _HomeTabPageState();
}


class _HomeTabPageState extends State<HomeTabPage> {



  Timer? timer;
  int updater = 0;

  @override
  initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 10), (Timer t) => locatePosition());
  }

  @override
  void dispose() {
    Fluttertoast.showToast(msg: "timer canceled");
    timer?.cancel();
    super.dispose();
  }


  GoogleMapController? newGoogleMapController;

  final Completer<GoogleMapController> _controllergooglemap = Completer();

  Position? currentPosition;
  var geoLocator = Geolocator();
  double topPaddingOfMap = 0;



  //Getting current location
  locatePosition() async{
    updater++;
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    LatLng latlatPosition = LatLng(position.latitude, position.longitude);

    Map locationInfoMap = {
      "latitude": position.latitude.toString().trim(),
      "longitude": position.longitude.toString().trim(),
    };

    DatabaseReference driversRef = FirebaseDatabase.instance.ref().child("drivers");
    driversRef.child(currentFirebaseUser!.uid).child("location_details").set(locationInfoMap).asStream();

    Fluttertoast.showToast(msg: "location details has been saved " + updater.toString()  + " times");

//Move camera to the current position
    CameraPosition cameraPosition = CameraPosition(target: latlatPosition,zoom: 14);
    newGoogleMapController?.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }


  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  blackThemeGoogleMap(){
    newGoogleMapController!.setMapStyle('''
                    [
                      {
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#242f3e"
                          }
                        ]
                      },
                      {
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#746855"
                          }
                        ]
                      },
                      {
                        "elementType": "labels.text.stroke",
                        "stylers": [
                          {
                            "color": "#242f3e"
                          }
                        ]
                      },
                      {
                        "featureType": "administrative.locality",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#d59563"
                          }
                        ]
                      },
                      {
                        "featureType": "poi",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#d59563"
                          }
                        ]
                      },
                      {
                        "featureType": "poi.park",
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#263c3f"
                          }
                        ]
                      },
                      {
                        "featureType": "poi.park",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#6b9a76"
                          }
                        ]
                      },
                      {
                        "featureType": "road",
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#38414e"
                          }
                        ]
                      },
                      {
                        "featureType": "road",
                        "elementType": "geometry.stroke",
                        "stylers": [
                          {
                            "color": "#212a37"
                          }
                        ]
                      },
                      {
                        "featureType": "road",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#9ca5b3"
                          }
                        ]
                      },
                      {
                        "featureType": "road.highway",
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#746855"
                          }
                        ]
                      },
                      {
                        "featureType": "road.highway",
                        "elementType": "geometry.stroke",
                        "stylers": [
                          {
                            "color": "#1f2835"
                          }
                        ]
                      },
                      {
                        "featureType": "road.highway",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#f3d19c"
                          }
                        ]
                      },
                      {
                        "featureType": "transit",
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#2f3948"
                          }
                        ]
                      },
                      {
                        "featureType": "transit.station",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#d59563"
                          }
                        ]
                      },
                      {
                        "featureType": "water",
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#17263c"
                          }
                        ]
                      },
                      {
                        "featureType": "water",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#515c6d"
                          }
                        ]
                      },
                      {
                        "featureType": "water",
                        "elementType": "labels.text.stroke",
                        "stylers": [
                          {
                            "color": "#17263c"
                          }
                        ]
                      }
                    ]
                ''');
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          GoogleMap(
            padding: EdgeInsets.only(top: topPaddingOfMap),
            mapType: MapType.normal,
            myLocationEnabled: true,
            initialCameraPosition: _kGooglePlex,
            //current location tools start
            zoomGesturesEnabled: true,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: false,
            //end
            onMapCreated: (GoogleMapController controller){
              _controllergooglemap.complete(controller);
              newGoogleMapController = controller;

              setState(() {
                topPaddingOfMap = 60.0;
              });
              //Get the current position
              locatePosition();

              //black theme google map
              blackThemeGoogleMap();
            },
          ),

          Container(
            margin: const EdgeInsets.fromLTRB(0, 40.0, 0, 0),
            alignment: Alignment.topCenter,
            child: const Text("Switched ON",
            style: TextStyle(
              fontSize: 25,
              color: Colors.lightGreenAccent,
              fontWeight: FontWeight.bold,
            ),),

          ),

          Container(
            alignment: Alignment.bottomCenter,
            margin:const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: ElevatedButton(onPressed: (){
              dispose();
              Navigator.push(context, MaterialPageRoute(builder: (c)=>const MainScreen()));
            }, child:const Text("CLICK HERE TO STOP WORKING",
            style: TextStyle(
              fontSize: 18
            ),),
              style: ElevatedButton.styleFrom(

                primary: Colors.black,
                padding: const EdgeInsets.fromLTRB(40.0,20.0,40.0,20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // <-- Radius
                ),
              ),),
          ),



        ],
      ),
    );
  }
}
