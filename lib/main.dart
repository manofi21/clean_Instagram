import 'package:flutter/material.dart';
import 'package:instagram_layout_clean/screens/feed_screen.dart';

import 'screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Instagram ',
      debugShowCheckedModeBanner: false,
      home: Regist(),
      // home: FeedScreen()
    );
  }
}
