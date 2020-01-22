import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travel/routes/home/widgets/searchbar.dart';
import 'package:travel/routes/locations/widgets/mapbackground.dart';

class Locations extends StatelessWidget {
  final List<LatLng> places = [
    LatLng(34.088715, -118.474498),
    LatLng(34.054221, -118.250509),
    LatLng(34.069856, -118.403656),
    LatLng(34.027456, -118.394424)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            MapBackground(placesPositions: this.places),
            SearchBarText()
          ],
        ),
      ),
    );
  }
}