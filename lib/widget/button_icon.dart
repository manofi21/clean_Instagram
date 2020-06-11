import 'package:flutter/material.dart';
import 'package:instagram_layout_clean/models/model.dart';
import 'navigator.dart';

class ButtonPattern {
  IconButton icons(IconData iconsData,VoidCallback callback) {
    return IconButton(
      icon: Icon(iconsData),
      iconSize: 30.0,
      onPressed: callback,
    );
  }
}

class ButtonWidgets extends ButtonPattern {
  IconButton likePost(){
    return icons(Icons.favorite_border, () => print('Like post'));
  }

  IconButton commandPost(BuildContext context, Post post) {
    return icons(Icons.chat, () => goToPostView(context, post));
  }

  IconButton more() {
    return icons(Icons.more_horiz, ()=> print("more"));
  }

  IconButton bookmarkBorder() {
    return icons(Icons.bookmark_border, () => print('Save post'));
  }

  IconButton liveTv() {
    return icons(Icons.live_tv, ()=> print('IGTV'));
  }

  IconButton send() {
    return icons(Icons.send, ()=> print('Direct Messages'));
  }

  IconButton arrowback(BuildContext context){
    return icons(Icons.arrow_back, ()=> goBack(context));
  }
}