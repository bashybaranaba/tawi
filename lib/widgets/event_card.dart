import 'package:flutter/material.dart';
import 'package:tawi/utils/dummy/events.dart';
import 'package:tawi/widgets/photo_carousel.dart';

class EventCard extends StatefulWidget {
  // final String imageURL;
  final Event event;

  const EventCard({super.key, required this.event});

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Container(
          width: double.infinity,
          child: Column(children: <Widget>[
            ClipRRect(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: PhotoCarousel(photoUrls: widget.event.images),
              ),
            ),
            const SizedBox(height: 25),
            Row(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
              Wrap(
                  alignment: WrapAlignment.start,
                  direction: Axis.vertical,
                  spacing: 5,
                  children: <Widget>[
                    Text(widget.event.organizer.name,
                        style: Theme.of(context).textTheme.displaySmall),
                    Text(widget.event.description,
                        style: Theme.of(context).textTheme.bodySmall),
                    Text('Date: ${widget.event.date}',
                        style: Theme.of(context).textTheme.bodySmall),
                  ]),
              const Spacer(),
              Wrap(
                  crossAxisAlignment: WrapCrossAlignment.end,
                  direction: Axis.vertical,
                  spacing: 7,
                  children: <Widget>[
                    Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: <Widget>[
                          const Icon(Icons.location_on, size: 18),
                          Text(widget.event.distance,
                              style: Theme.of(context).textTheme.bodySmall),
                        ]),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            color: Theme.of(context).shadowColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 4,
                                children: <Widget>[
                                  Icon(Icons.people_alt_outlined,
                                      size: 16,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor),
                                  Text("${widget.event.participants}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .scaffoldBackgroundColor))
                                ])))
                  ])
            ]),
            const Padding(
                padding: EdgeInsets.only(top: 50), child: Divider(thickness: 2))
          ])),
    );
  }
}
