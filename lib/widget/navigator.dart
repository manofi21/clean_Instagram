import 'package:flutter/material.dart';
import 'package:last_instagram/model/post.dart';
import 'package:last_instagram/screens/post_screen.dart';
import 'package:last_instagram/screens/feed_screen.dart';
import 'package:last_instagram/screens/story_screen.dart';

void goToPostView(BuildContext context, Post posts) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => ViewPostScreen(
        post: posts,
      ),
    ),
  );
}

void goBack(BuildContext context) {
  Navigator.pop(context);
}

void goToStory(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => StoryPage()));
}

void goToFeedScreen(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => FeedScreen()));
}