import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_google_map/data/lat_lng_data.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class RealTimeLocationScreen extends StatefulWidget {
  const RealTimeLocationScreen({super.key});

  @override
  State<RealTimeLocationScreen> createState() => _RealTimeLocationScreenState();
}

class _RealTimeLocationScreenState extends State<RealTimeLocationScreen> {
  Location location = Location();

  LocationData? primaryLocation;
  LocationData? currentLocation;

  late StreamSubscription locationSubscription;
  late GoogleMapController googleMapController;

  void getCurrentLocation() {
    locationSubscription =
        location.onLocationChanged.listen((realTimeLocation) {
      Timer.periodic(const Duration(seconds: 10), (animationTimer) {
        currentLocation = realTimeLocation;
        googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              // 23.8756246825831, 90.39097262158216
              target: LatLng(realTimeLocation.latitude ?? 23.8756246825831,
                  realTimeLocation.longitude ?? 90.39097262158216),
              zoom: 16,
            ),
          ),
        );
        if (mounted) {
          setState(() {});
        }
        animationTimer.cancel();
      });
    });
  }

  Future<void> getPrimaryLocation() async {
    primaryLocation = await location.getLocation();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();

    getCurrentLocation();
    getPrimaryLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Real Time Location Tracker",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: cameraTarget,
        ),
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
        markers: {
          Marker(
            markerId: const MarkerId('my_current_location'),
            position: LatLng(
              // 23.8756246825831, 90.39097262158216
              currentLocation?.latitude ?? primaryLat,
              currentLocation?.longitude ?? primaryLng,
            ),
            infoWindow: InfoWindow(
              title: "My Real Time Location",
              snippet:
                  '${currentLocation?.latitude} , ${currentLocation?.longitude}',
            ),
          ),
          Marker(
            markerId: const MarkerId('my_primary_location'),
            position: LatLng(
              // 23.8756246825831, 90.39097262158216
              primaryLocation?.latitude ?? primaryLat,
              primaryLocation?.longitude ?? primaryLng,
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
            infoWindow: InfoWindow(
              title: "This is my primary location",
              snippet:
                  '${primaryLocation?.latitude ?? primaryLat} , ${primaryLocation?.longitude ?? primaryLng}',
            ),
          ),
        },
        polylines: {
          Polyline(
            polylineId: const PolylineId("primary_location"),
            width: 6,
            color: Colors.red,
            points: [
              LatLng(
                // 23.8756246825831, 90.39097262158216
                primaryLocation?.latitude ?? primaryLat,
                primaryLocation?.longitude ?? primaryLng,
              ),
              LatLng(
                // 23.8756246825831, 90.39097262158216
                currentLocation?.latitude ?? primaryLat,
                currentLocation?.longitude ?? primaryLng,
              ),
            ],
          ),
        },
      ),
    );
  }

  @override
  void dispose() {
    locationSubscription.cancel();
    super.dispose();
  }
}
