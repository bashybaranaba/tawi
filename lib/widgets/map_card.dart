import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:tawi/widgets/full_screen_map.dart';
import 'package:tawi/screens/volunteers/eventDetailsPage.dart';

class MapCard extends StatefulWidget {
  final LatLng center;
  bool fullscreen;
  bool showDirections;
  List<Marker> markers;

  MapCard({
    required this.center,
    this.fullscreen = false,
    this.showDirections = true,
    this.markers = const [],
  });

  @override
  _MapCardState createState() => _MapCardState();
}

class _MapCardState extends State<MapCard> {
  late GoogleMapController mapController;
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _markers.addAll(widget.markers);
  }

  void _onDirectionsButtonPressed() async {
    final availableMaps = await MapLauncher.installedMaps;
    if (availableMaps.isNotEmpty) {
      await availableMaps.first.showDirections(
        destination: Coords(widget.center.latitude, widget.center.longitude),
        destinationTitle: 'Event Location',
      );
    }
  }

  void _onSizeButtonPressed() {
    setState(() {
      widget.fullscreen = !widget.fullscreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: widget.fullscreen ? MediaQuery.of(context).size.height : 260,
          width: widget.fullscreen ? MediaQuery.of(context).size.width : 320,
          child: GoogleMap(
            onMapCreated: (controller) {
              mapController = controller;
            },
            initialCameraPosition: CameraPosition(
              target: widget.center,
              zoom: 15,
            ),
            markers: _markers,
          ),
        ),
        Container(
            width: 320,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (widget.showDirections)
                  ElevatedButton(
                    onPressed: _onDirectionsButtonPressed,
                    child: const Text('Get Directions'),
                  ),
                if (!widget.fullscreen)
                  ElevatedButton(
                    onPressed: _onSizeButtonPressed,
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(0),
                    ),
                    child: const Icon(Icons.open_in_full_rounded),
                  ),
                if (widget.fullscreen)
                  ElevatedButton(
                    onPressed: _onSizeButtonPressed,
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(5),
                    ),
                    child: const Icon(Icons.close_fullscreen_rounded),
                  ),
              ],
            ))
      ],
    );
  }
}
