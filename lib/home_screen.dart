import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: const Text("Flutter App with Google Map"),
      ),
      body: const GoogleMap(initialCameraPosition: CameraPosition(target: LatLng(
          23.894952886966312,90.59058570439981
      ),
      zoom: 17,
        bearing: 5,
        tilt: 5,
      ),


      ),
    ));
  }
}
