import 'package:tawi/utils/dummy/events.dart';
import 'package:tawi/utils/dummy/users.dart';

class Post {
  final User poster;
  final Event event;
  final String description;
  final String date;
  final int likeCount;
  final bool liked;
  final List<String>? tags;
  final List<String> images;

  Post(this.poster, this.event, this.description, this.date, this.likeCount,
      this.liked, this.tags, this.images);
}
