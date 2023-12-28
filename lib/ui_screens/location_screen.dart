
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_google_map/ui_screens/home_screen.dart';
import 'package:flutter_google_map/ui_screens/real_time_location_screen.dart';
import 'package:location/location.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  Location location= Location();

  LocationData? currentLocation;

  LocationData? myLocation;

  late StreamSubscription locationSubscription;

  @override
  void initState() {
    listenToLocation();
    super.initState();
  }

  void listenToLocation(){
     locationSubscription=location.onLocationChanged.listen((locationData) {
        myLocation=locationData;

        if(mounted){
          setState(() {});
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Location Screen"),
          titleTextStyle: const TextStyle(color: Colors.white,fontSize: 25),
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("My Current Location: ${myLocation?.latitude??''},${myLocation?.longitude??''}",style: const TextStyle(fontSize: 24),),
                const SizedBox(height: 16,),

                Text("My Location: ${currentLocation?.latitude??''},${currentLocation?.longitude??''}",style: const TextStyle(fontSize: 24),),
                const SizedBox(height: 16,),
                ElevatedButton(
                    onPressed: () async {
                  currentLocation= await location.getLocation();

                  print("Latitude: ${currentLocation?.latitude}");
                  print("Longiture: ${currentLocation?.longitude}");
                  print("Altitude: ${currentLocation?.altitude}");


                }, child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Get current location",style: TextStyle(fontSize: 30),),
                )),
                const SizedBox(height: 16,),
                 const Text("Get Permission",style: TextStyle(fontSize: 30),),
                const SizedBox(height: 16,),
                ElevatedButton(
                    onPressed: () async{

                      PermissionStatus status=await location.hasPermission();
                      if(status==PermissionStatus.denied||status==PermissionStatus.deniedForever){
                        await location.requestPermission();
                        await location.getLocation();
                      }

                      print(await location.hasPermission());
                }, child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Get Permission",style: TextStyle(fontSize: 30),),
                )),
                const SizedBox(height: 16,),
                ElevatedButton(
                    onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
                }, child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Google Map",style: TextStyle(fontSize: 30),),
                )),

                const SizedBox(height: 16,),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const RealTimeLocationScreen()));
                    }, child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Real Time Location Screen",style: TextStyle(fontSize: 30),),
                )),

              ],
            ),
          ),
        ),

      ),
    );
  }
}
