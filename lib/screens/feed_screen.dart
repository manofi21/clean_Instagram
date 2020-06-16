import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:last_instagram/method/dbHelper.dart';
import 'package:last_instagram/method/method.dart';
import 'package:last_instagram/model/image_str.dart';
import 'package:last_instagram/model/post.dart';
// import 'package:last_instagram/model/post.dart';
import 'package:last_instagram/widget/midle_widget.dart';
import 'package:last_instagram/widget/widget.dart';

import '../state_container.dart';

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
        for(int i = 0; i < imgs.length; i++) {
          posts.add(imgs[i]);
        }
        // posts.addAll(imgs);
      });
    });
  }

  void initState() {
    super.initState();
    posts = [];
    refreshImages();
  }

  Widget nullExecption(Widget widgets) {
    if (posts.isNotEmpty || posts != null) {
      return widgets;
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    GetASet getASet = GetASet();
    final container = StateContainer.of(context);
    int id = container.index;
    return Scaffold(
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: [
          instagramHeaders(),
          Container(
              width: double.infinity,
              height: 100.0,
              child: listProfile(stories)),
          BuildPostScreen(listPost: posts)
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
            sideButtomNav(Icons.dashboard),
            sideButtomNav(Icons.search),
            centerButtomsNav(() async {
              print(id);
              DBHelper help = DBHelper();
              var now = new DateTime.now();
              final timeNow = DateFormat("HH:mm:ss").format(now);
              await pickImage(getASet).then((value) {
                // print(getASet.str_name);
                print(id);
                help
                    .postImages(SavePost(
                        id_author: id,
                        image: getASet.str_name,
                        timeAgo: timeNow))
                    .then((value) => refreshImages());
              });
            }),
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
