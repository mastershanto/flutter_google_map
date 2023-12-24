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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter App with Google Map"),
        ),
        body: GoogleMap(
          initialCameraPosition: const CameraPosition(
            target: LatLng(23.87540384373909, 90.39106244138632),
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
          zoomControlsEnabled: false,
          zoomGesturesEnabled: false,
          compassEnabled: false,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          markers: {
            Marker(
              markerId: const MarkerId("Initial Position"),
              position: const LatLng(23.874565691548938, 90.39105165708051),
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
              position: const LatLng(23.874447353830963, 90.39064933420146),
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
              position: const LatLng(23.874161730520402, 90.39064542983508),
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
              polylineId: const PolylineId("1st line"),
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
                const LatLng(23.87777611829549, 90.39214164018631),
                const LatLng(23.875073585712567, 90.38890488445759),
                const LatLng(23.872455922937064, 90.39185933768749),
                const LatLng(23.872455922937064, 90.39185933768749),
                const LatLng(23.87777611829549, 90.39214164018631),
              ],
            ),
          },
          polygons: {
            Polygon(
              polygonId: PolygonId("1st Polygon"),
              fillColor: Colors.transparent,
              strokeColor: Colors.blue,
              strokeWidth: 4,

              consumeTapEvents: true,
              //for getting response by tapping.
              onTap: () {
                print("You have tapped on my area");
              },
              points: [
                LatLng(23.875315175720445, 90.39019301533699),
                LatLng(23.875895541752076, 90.39099030196667),
                LatLng(23.8753295852625, 90.39174433797598),
                LatLng(23.874212381115097, 90.39160050451756),
                LatLng(23.873828531581026, 90.39068754762411),
              ],
            ),
          },
          circles: {
            Circle(
              circleId: CircleId("1st Circle"),
              center: LatLng(23.872350761567404, 90.38974609225988),
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
              circleId: CircleId("1st Circle"),
              center: LatLng(23.872350761567404, 90.38974609225988),
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
              circleId: CircleId("1st Circle"),
              center: LatLng(23.872350761567404, 90.38974609225988),
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
