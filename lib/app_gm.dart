import 'package:flutter/material.dart';
import 'package:flutter_google_map/ui_screens/real_time_location_screen.dart';

// import 'ui_screens/location_screen.dart';

class AppWithGoogleMap extends StatelessWidget {
  const AppWithGoogleMap({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Map Project',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.blue,
      ),
      home:  const RealTimeLocationScreen(),
    );
  }
}
