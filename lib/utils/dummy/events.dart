import 'package:tawi/utils/dummy/users.dart';

class Event {
  final User organizer;
  final String description;
  final String date;
  final String distance;
  final int participants;
  final List<String> images;

  Event(this.organizer, this.description, this.date, this.distance,
      this.participants, this.images);
}
