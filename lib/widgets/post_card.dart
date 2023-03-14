import 'package:flutter/material.dart';
import 'package:tawi/utils/dummy/posts.dart';
import 'package:tawi/widgets/photo_carousel.dart';

class PostCard extends StatefulWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeader(),
          _buildPostImage(),
          _buildPostContent(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 20.0,
            backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),
          ),
          SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.post.poster.name,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 5.0),
              Text("Some Important Person",
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    fontSize: 14.0,
                  )),
            ],
          ),
          const SizedBox(width: 120.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.favorite_border_outlined, color: Colors.red),
              SizedBox(width: 3.0),
              Text(widget.post.likeCount.toString()),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildPostImage() {
    return widget.post.images.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: PhotoCarousel(photoUrls: widget.post.images),
            ),
          )
        : SizedBox.shrink();
  }

  Widget _buildPostContent() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.post.description),
            const SizedBox(height: 5),
            ((widget.post.tags != null && widget.post.tags!.isNotEmpty)
                ? Text(widget.post.tags!.join(" "),
                    style: Theme.of(context).textTheme.bodySmall)
                : const Text("")),
            const SizedBox(height: 7),
            Text(widget.post.date,
                textAlign: TextAlign.end,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                  fontSize: 13.0,
                ))
          ],
        ));
  }
}
