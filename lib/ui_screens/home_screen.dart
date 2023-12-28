import 'package:flutter/material.dart';
import 'package:flutter_google_map/data/lat_lng_data.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late GoogleMapController googleMapController;
  Location location = Location();

  late final LocationData locationData;

  Future<void> getCurrentLocation() async {
    locationData = await location.getLocation();
    // googleMapController.moveCamera(
    //   CameraUpdate.newCameraPosition(
    //     CameraPosition(
    //       target: LatLng(locationData.longitude!, locationData.longitude!),
    //     ),
    //   ),
    // );

    googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(locationData.longitude!, locationData.longitude!),
        zoom: 17
    ),));
    if (mounted) {
      setState(() {

      });
    }

  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter App with Google Map"),
        ),
        body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: cameraTarget,
            zoom: 17,
            bearing: 5,
            tilt: 5,
          ),
          onTap: (LatLng position) {
            print(position);
          },
          onLongPress: (LatLng latLng) {
            print('On long press at $latLng');
          },
          onCameraMove: (cameraPosition) {
            print(cameraPosition);
          },

          onMapCreated: (GoogleMapController controller) {
            googleMapController = controller;
            getCurrentLocation();
          },

          zoomControlsEnabled: false,
          zoomGesturesEnabled: false,
          compassEnabled: false,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          markers: {
            Marker(
              markerId: const MarkerId("Initial Position"),
              position: markerOne,
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueYellow),
              infoWindow: const InfoWindow(
                  title: "This is title", snippet: "This is snippet"),
              draggable: true,
              onDragEnd: (LatLng position) {
                print("DragEnd: $position");
              },
              onDragStart: (LatLng position) {
                print("DragStart: $position");
              },
              onDrag: (LatLng position) {
                print("onDrag: $position");
              },
              onTap: () {
                print("On tapped in the map.");
              },
            ),
            Marker(
              markerId: const MarkerId("Initial Position"),
              position: markerTwo,
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueGreen),
              infoWindow: const InfoWindow(
                  title: "This is title", snippet: "This is snippet"),
              draggable: true,
              onDragEnd: (LatLng position) {
                print("DragEnd: $position");
              },
              onDragStart: (LatLng position) {
                print("DragStart: $position");
              },
              onDrag: (LatLng position) {
                print("onDrag: $position");
              },
              onTap: () {
                print("On tapped in the map.");
              },
            ),
            Marker(
              markerId: const MarkerId("Initial Position"),
              position: markerThree,
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueBlue),
              infoWindow: const InfoWindow(
                  title: "This is title", snippet: "This is snippet"),
              draggable: true,
              onDragEnd: (LatLng position) {
                print("DragEnd: $position");
              },
              onDragStart: (LatLng position) {
                print("DragStart: $position");
              },
              onDrag: (LatLng position) {
                print("onDrag: $position");
              },
              onTap: () {
                print("On tapped in the map.");
              },
            ),
          },
          polylines: {
            Polyline(
              polylineId: const PolylineId("triangle by polyline"),
              color: Colors.red,
              width: 6,
              visible: true,
              endCap: Cap.buttCap,
              jointType: JointType.mitered,
              patterns: [
                PatternItem.gap(10),
                PatternItem.dash(10),
                PatternItem.dot,
                PatternItem.dash(10),
              ],
              points: [
                polylineOneOne,
                polylineOneTwo,
                polylineOneThree,
                polylineOneThree,
                polylineOneFour
                 ],
            ),
          },
          polygons: {
            Polygon(
              polygonId: const PolygonId("1st Polygon"),
              fillColor: Colors.transparent,
              strokeColor: Colors.blue,
              strokeWidth: 4,

              consumeTapEvents: true,
              //for getting response by tapping.
              onTap: () {
                print("You have tapped on my area");
              },
              points: [
                polylineTwoOne,
                polylineTwoTwo,
                polylineTwoThree,
                polylineTwoThree,
                polylineTwoFour,
              ],
            ),
          },
          circles: {
            Circle(
              circleId: const CircleId("1st Circle"),
              center: circleOne,
              radius: 100,
              fillColor: Colors.pink.shade700,
              strokeColor: Colors.green,
              strokeWidth: 4,
              consumeTapEvents: true,
              onTap: () {
                print("This is my Circle Area");
              },
            ),
            Circle(
              circleId: const CircleId("2nd Circle"),
              center: circleTwo,
              radius: 75,
              fillColor: Colors.blue,
              strokeColor: Colors.green,
              strokeWidth: 4,
              consumeTapEvents: true,
              onTap: () {
                print("This is my Circle Area");
              },
            ),
            Circle(
              circleId: const CircleId("3rd Circle"),
              center: circleThree,
              radius: 50,
              fillColor: Colors.yellow,
              strokeColor: Colors.green,
              strokeWidth: 4,
              consumeTapEvents: true,
              onTap: () {
                print("This is my Circle Area");
              },
            ),
          },
        ),
      ),
    );
  }
}