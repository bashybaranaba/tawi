import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:tawi/utils/dummy/events.dart';
import 'package:tawi/widgets/bottom_nav_bar.dart';
import 'package:tawi/widgets/event_card.dart';
import 'package:tawi/utils/themes/colors.dart';
import 'package:tawi/widgets/map_card.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tawi/widgets/marker_generator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';

import '../../widgets/action_button.dart';

class EventDetailsPage extends StatefulWidget {
  const EventDetailsPage({super.key, required this.event});
  final Event event;

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.GREEN_PRIMARY,
          title: const Text('Event Details'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: [
                EventCard(event: widget.event),
                Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 50),
                    child: Column(children: [
                      Text("Event Description",
                          style: Theme.of(context).textTheme.displaySmall),
                      const SizedBox(height: 20),
                      Text(widget.event.description,
                          style: Theme.of(context).textTheme.bodyMedium)
                    ])),
                const SizedBox(height: 10),
                Center(
                    child: Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Text("Event Location",
                            style: Theme.of(context).textTheme.displaySmall))),
                MapCard(
                    showDirections: false,
                    center:
                        LatLng(widget.event.latitude, widget.event.longitude),
                    markers: createMarkers([widget.event], (event) async {
                      final availableMaps = await MapLauncher.installedMaps;
                    })),
                const SizedBox(height: 20),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 20),
                    child: ActionButton(
                      text: 'Sign Up',
                      onPressed: () {
                        // Do something when the button is pressed
                      },
                    )),
              ],
            )),
        bottomNavigationBar: const BottomNavBar());
  }
}
