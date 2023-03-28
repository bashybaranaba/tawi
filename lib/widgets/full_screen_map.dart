import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FullScreenMap extends StatefulWidget {
  final LatLng center;

  const FullScreenMap({super.key, required this.center});

  @override
  _FullScreenMapState createState() => _FullScreenMapState();
}

class _FullScreenMapState extends State<FullScreenMap> {
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Text("Hello");
    // return Scaffold(
    //   body: GoogleMap(
    //     onMapCreated: (controller) {
    //       mapController = controller;
    //     },
    //     initialCameraPosition: CameraPosition(
    //       target: widget.center,
    //       zoom: 15,
    //     ),
    //   ),
    // );
  }
}
