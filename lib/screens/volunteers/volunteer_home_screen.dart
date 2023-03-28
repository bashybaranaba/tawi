import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tawi/widgets/bottom_nav_bar.dart';
import 'package:tawi/widgets/search_bar.dart';
import 'package:tawi/widgets/event_card.dart';
import 'package:tawi/widgets/marker_generator.dart';
import 'package:tawi/utils/themes/colors.dart';
import 'package:tawi/utils/dummy/events.dart';
import 'package:tawi/utils/dummy/events_data.dart';
import 'package:tawi/widgets/map_card.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tawi/services/location_service.dart';
import 'package:tawi/screens/volunteers/eventDetailsPage.dart';
import 'package:geolocator/geolocator.dart';

class VolunteerHome extends StatefulWidget {
  const VolunteerHome({super.key});

  @override
  State<VolunteerHome> createState() => _VolunteerHomeState();
}

class _VolunteerHomeState extends State<VolunteerHome> {
  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
    'Item 10',
  ];

  final List<Event> events = event_list;

// // create a marker widget for each event
//   List<Marker> createMarkers(List<Event> events) {
//     return events
//         .map((event) => Marker(
//               markerId: MarkerId(event.id.toString()),
//               position: LatLng(event.latitude, event.longitude),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => EventDetailsScreen(event: event)),
//                 );
//               },
//             ))
//         .toList();
//   }

  late Position deviceLocation;

  //  = await getDevicePosition();
  @override
  void initState() {
    super.initState();
    getDevicePosition().then((value) {
      setState(() {
        deviceLocation = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Marker> markers = createMarkers(events, (event) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EventDetailsPage(event: event),
        ),
      );
    });
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(height: 16), // Add some spacing
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: SearchField(
                hintText: 'Search for events',
                onChanged: (query) {
                  // Do something with the search query
                },
                suffixIcon: IconButton(
                  icon: const Icon(Icons.tune),
                  onPressed: () {
                    // Open drawer with filter options
                  },
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              // This is the horizontal scrolling list
              Container(
                  height: 400,
                  color: Theme.of(context).cardColor,
                  child: Column(children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text("Featured",
                                textAlign: TextAlign.left,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(color: AppColors.GREEN_DARK)))),
                    const SizedBox(height: 20),
                    Container(
                        height: 200,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: items.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Card(
                                  child: Container(
                                    width: 300.0,
                                    height: (300 * (9 / 16)),
                                    child: Center(
                                      child: Text(
                                        items[index],
                                        style: TextStyle(fontSize: 24.0),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            })),
                  ])),
            ]),
          ),
          SliverToBoxAdapter(
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 60),
                      child: Text("Events around me",
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.displayMedium)))),
          //GOOGLE MAP GOES HERE
          //
          //
          SliverToBoxAdapter(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 10, 5, 60),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10), // Image border
                  child: Container(
                    // width: 300,
                    // height: (320),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: MapCard(
                        showDirections: false,
                        center: LatLng(
                            deviceLocation.latitude, deviceLocation.longitude),
                        markers: markers),
                  ),
                )), // Add some spacing
          ),
          //
          //
          //GOOGLE MAP ENDS HERE

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                // This is the vertically scrolling list
                return EventCard(
                  event: events[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EventDetailsPage(event: events[index]),
                      ),
                    );
                  },
                );
              },
              childCount: events.length, // Length of items (Events)
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
