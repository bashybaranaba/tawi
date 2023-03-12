import 'package:flutter/material.dart';
import 'package:tawi/widgets/bottom_nav_bar.dart';
import 'package:tawi/widgets/search_bar.dart';
import 'package:tawi/widgets/event_card.dart';
import 'package:tawi/utils/themes/colors.dart';
import 'package:tawi/utils/dummy/events.dart';
import 'package:tawi/utils/dummy/events_data.dart';

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

  @override
  Widget build(BuildContext context) {
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
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 60),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Image border
                  child: Container(
                    width: 300,
                    height: (300 * (9 / 12)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.network(
                        'https://media.wired.com/photos/59269cd37034dc5f91bec0f1/191:100/w_1280,c_limit/GoogleMapTA.jpg',
                        fit: BoxFit.cover),
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
                return EventCard(event: events[index]);
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
