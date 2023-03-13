import 'package:flutter/material.dart';
import 'package:tawi/widgets/bottom_nav_bar.dart';
import 'package:tawi/widgets/post_card.dart';
import 'package:tawi/utils/dummy/posts_data.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
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
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 25, bottom: 15),
              child: const Text(
                "Posts from around",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                // This is the vertically scrolling list
                return PostCard(post: postList[index]);
              },
              childCount: postList.length, // Length of items (Posts)
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
