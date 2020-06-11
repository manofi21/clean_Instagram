import 'package:flutter/material.dart';
import 'package:instagram_layout_clean/models/model.dart';
import 'package:instagram_layout_clean/widget/midle_widget.dart';
import 'package:instagram_layout_clean/widget/widget.dart';


class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDF0F6),
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          instagramHeaders(),
          Container(
              width: double.infinity,
              height: 100.0,
              child: listProfile(stories)),
          BuildPostScreen(listPost: posts,)
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            sideButtomNav(Icons.dashboard), // Icons.search,
            sideButtomNav(Icons.search), //Icons.favorite_border,
            centerButtomsNav(),
            sideButtomNav(Icons.favorite_border),
            sideButtomNav(
              Icons.person_outline,
            )
          ],
        ),
      ),
    );
  }
}
