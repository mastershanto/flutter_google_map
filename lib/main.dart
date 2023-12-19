import 'package:flutter/material.dart';
import 'package:flutter_google_map/home_screen.dart';

void main() {
  runApp(const AppWithGoogleMap());
}

class AppWithGoogleMap extends StatelessWidget {
  const AppWithGoogleMap({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Map Project',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.white,
      ),
      home:  HomeScreen(),
    );
  }
}

