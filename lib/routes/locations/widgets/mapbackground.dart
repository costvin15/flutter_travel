import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapBackground extends StatefulWidget {
  final List<LatLng> placesPositions;

  MapBackground({
    Key key,
    @required this.placesPositions
  });

  @override
  _MapBackgroundState createState() => _MapBackgroundState();
}

class _MapBackgroundState extends State<MapBackground> {
  Completer<GoogleMapController> _controller = Completer();
  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(0, 0),
    zoom: 15,
  );
  String _mapStyle;

  @override
  void initState() {
    super.initState();
    rootBundle.loadString("assets/map_style.json").then((string){
      _mapStyle = string;
    });

    _kGooglePlex = CameraPosition(
      target: widget.placesPositions[0],
      zoom: 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        zoomGesturesEnabled: false,
        scrollGesturesEnabled: false,
        rotateGesturesEnabled: false,
        myLocationButtonEnabled: false,
        mapType: MapType.normal,
        initialCameraPosition: this._kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          controller.setMapStyle(_mapStyle);
          _controller.complete(controller);
        },
        markers: Set.from(List.generate(widget.placesPositions.length, (index){
          return Marker(
            markerId: MarkerId('marker-$index'),
            position: widget.placesPositions[index]
          );
        }))
      );
  }
}