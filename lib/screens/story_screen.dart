import 'package:flutter/material.dart';
import 'package:story_view/story_controller.dart';
import 'package:story_view/story_view.dart';

class StoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = StoryController();
    final List<StoryItem> storyItem = [
      StoryItem.text("HELLO WORLD", Colors.blue),
      StoryItem.text("title", Colors.red)
    ];

    return Material(
        child: StoryView(
      storyItem,
      controller: controller,
      inline: false,
      repeat: false,
      onComplete: () => Navigator.pop(context),
    ));
  }
}
