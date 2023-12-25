
import 'package:flutter/material.dart';
import 'package:flutter_google_map/home_screen.dart';
import 'package:location/location.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  Location location= Location();

  LocationData? currentLocation;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Location Screen"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("My Location ${currentLocation?.latitude??''},${currentLocation?.longitude??''}",style: const TextStyle(fontSize: 24),),
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
              ElevatedButton(
                  onPressed: (){

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
              ))

            ],
          ),
        ),

      ),
    );
  }
}
