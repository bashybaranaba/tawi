import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tawi/utils/dummy/events.dart';

List<Marker> createMarkers(List<Event> events, Function(Event) onTap) {
  List<Marker> markers = [];

  for (int i = 0; i < events.length; i++) {
    Event event = events[i];
    Marker marker = Marker(
      markerId: MarkerId(event.id.toString()),
      position: LatLng(event.latitude, event.longitude),
      infoWindow: InfoWindow(
        title: event.organizer.name,
        snippet: event.title,
        onTap: () => onTap,
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      // onTap: () => onTap(event),
    );
    markers.add(marker);
  }

  return markers;
}
