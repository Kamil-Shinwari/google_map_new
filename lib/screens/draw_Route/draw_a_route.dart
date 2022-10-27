import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_routes/google_maps_routes.dart';
import 'package:googlemap/screens/MyHomePagee.dart';
import 'package:googlemap/screens/homepage.dart';
import 'package:googlemap/screens/login.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
 var x1=Uuid();
 DateTime? now = DateTime. now();
class MapsRoutesExample extends StatefulWidget {
  const MapsRoutesExample({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MapsRoutesExampleState createState() => _MapsRoutesExampleState();
}

class _MapsRoutesExampleState extends State<MapsRoutesExample> {
  Completer<GoogleMapController> _controller = Completer();

  List<LatLng> points = [];

  MapsRoutes route = new MapsRoutes();
  DistanceCalculator distanceCalculator = new DistanceCalculator();
  String googleApiKey = 'AIzaSyDUpkW2Cixeg33umfD87s9CYkzsSyC3jXI';
  String totalDistance="No route";
   List<Marker> markers = [];
   getDistance() {
    setState(() {
      totalDistance = drawRoute();
    });
   }
  
   int id=1;
   String? x5= x1.v1();
 Set<Polyline> _polyline = Set<Polyline>();
//  DateTime? now = DateTime. now();
String formattedDate = DateFormat("yyyy-MM-dd"). format(now!);
@override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: GoogleMap(
              myLocationButtonEnabled: true,
              // myLocationEnabled: true,
              onTap: (LatLng latLng) async{
                
                var x2=latLng;
                
                log("x2 $x2");
                  Marker newMarker= Marker(markerId: MarkerId("$id"),
              position: LatLng(latLng.latitude,latLng.longitude),
              infoWindow: InfoWindow(title: "Marker added"),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueRed
              ),
              );
              if(markers.length==0){
                FirebaseFirestore.instance.collection("Routes")
                .doc(x5.toString())
                .set({
                  "lat":x2.latitude,
                  "lon":x2.longitude,
                  "newlat":"",
                  "newlon":"",
                  "RideDeparted":DateTime.now(),
                  "name":FirebaseAuth.instance.currentUser!.displayName,
                  "title":formattedDate,
                  "uid":FirebaseAuth.instance.currentUser!.uid,
                });
                setState(() {
                  
                });
              }else {
                 FirebaseFirestore.instance.collection("Routes")
                .doc(x5.toString())
                .update({
                  
                  "newlat":x2.latitude,
                  "newlon":x2.longitude,
                }).then((value) {
                  setState(() {
                   
                      x5=x1.v1();
                  });
                });
                setState(() {
                  
                });
              }
              
              markers.add(newMarker);
              id++;
              setState(()async {
                points.add(LatLng(latLng.latitude, latLng.longitude));
                if(points.length >=2) {
              drawRoute();
              // Future.delayed(Duration(seconds: 4),() =>  Navigator.push(context, MaterialPageRoute(builder:(context) => Login(),)),);
                }
                
              });
              },
                markers: markers.map((e) => e).toSet(),
                //  polylines: Set<Polyline>.of(polylines.values),
              zoomControlsEnabled: false,
              polylines: route.routes,
              initialCameraPosition: const CameraPosition(
                zoom: 15.0,
                target: LatLng(40.715888142250016, -73.99345738955843),
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Align(
                    alignment: Alignment.center,
                    child:
                        Text(totalDistance, style: TextStyle(fontSize: 25.0)),
                  )),
            ),
          ),
          // Positioned(
          //   top: 160,
          //   left: 0,
          //   right: 0,
          //   bottom: 570,
          //   child: Container(
          //   width: 30,
          //   height: 30,
          //   decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.red),
          //   child: Icon(Icons.menu,color: Colors.white,))),
        ],
      ),
    );
  }


  drawRoute() async{
    // var x=TravelModes.driving;
       await route.drawRoute(points, 'Test routes',
              Color.fromRGBO(130, 78, 210, 1.0), googleApiKey,
              travelMode: TravelModes.driving);
          setState(() {
            totalDistance =
                distanceCalculator.calculateRouteDistance(points, decimals: 1);
          });
  }
}
