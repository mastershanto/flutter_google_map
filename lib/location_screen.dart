
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  Location location= Location();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Location Screen"),
        ),
        body: Column(
          children: [
            const Text("My Location"),
            ElevatedButton(onPressed: () async {
              final LocationData currentLocation= await location.getLocation();

              print(currentLocation.latitude);
              print(currentLocation.longitude);
              print(currentLocation.altitude);

            }, child: const Text("Get current location"))

          ],
        ),

      ),
    );
  }
}
