import 'package:flutter/material.dart';
import 'package:instagram_layout_clean/models/comment.dart';
import 'package:instagram_layout_clean/models/model.dart';
import 'package:instagram_layout_clean/widget/button_icon.dart';
import 'package:instagram_layout_clean/widget/midle_widget.dart';
import 'package:instagram_layout_clean/widget/widget.dart';


class ViewPostScreen extends StatefulWidget {
  final Post post;

  ViewPostScreen({this.post});

  @override
  _ViewPostScreenState createState() => _ViewPostScreenState();
}

class _ViewPostScreenState extends State<ViewPostScreen> {
  ButtonWidgets buttonWidgets = ButtonWidgets();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDF0F6),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 40.0),
              width: double.infinity,
              height: 600.0,
              decoration: circularWhite(),
              child: BuildPostCommanScreen(widget.post)
            ),
            SizedBox(height: 10.0),
            Container(
                width: double.infinity,
                height: 600.0,
                decoration: whiteTopRadius(),
                child: commandView(comments))
          ],
        ),
      ),
      bottomNavigationBar: Transform.translate(
        offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: 100.0,
          decoration: boxShadowBorderRadius(),
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                contentPadding: EdgeInsets.all(20.0),
                hintText: 'Add a comment',
                prefixIcon: Container(
                    margin: EdgeInsets.all(4.0),
                    width: 48.0,
                    height: 48.0,
                    decoration: shapeCircleShadows(),
                    child: circleProfile(
                        widget.post.authorImageUrl, Size(48, 48))),
                suffixIcon: Container(
                    margin: EdgeInsets.only(right: 4.0),
                    width: 70.0,
                    child: postYourCommand()),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
