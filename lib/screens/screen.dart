import 'package:flutter/material.dart';
import 'package:last_instagram/method/dbHelper.dart';
import 'package:last_instagram/method/method.dart';
import 'package:last_instagram/model/post.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final dbHelper = DBHelper();
  List<Post> posts;

  refreshImages() {
    getPost().then((imgs) {
      setState(() {
        posts.clear();
        posts.addAll(imgs);
      });
    });
  }

  void initState() {
    super.initState();
    posts = [];
    refreshImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}