import 'package:tawi/utils/dummy/users.dart';

class Event {
  final int id;
  final User organizer;
  final String title;
  final String description;
  final String date;
  final double latitude;
  final double longitude;
  final int participants;
  final List<String> images;

  Event(this.id, this.organizer, this.title, this.description, this.date,
      this.latitude, this.longitude, this.participants, this.images);
}
