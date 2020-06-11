import 'package:flutter/material.dart';
import 'package:instagram_layout_clean/models/model.dart';
import 'package:instagram_layout_clean/screens/post_screen.dart';
import 'package:instagram_layout_clean/screens/story_screen.dart';

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
