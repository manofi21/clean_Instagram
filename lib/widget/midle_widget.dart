import 'package:flutter/material.dart';
import 'package:instagram_layout_clean/models/comment.dart';
import 'package:instagram_layout_clean/models/header_post.dart';
import 'package:instagram_layout_clean/models/model.dart';
import 'package:instagram_layout_clean/widget/button_icon.dart';
import 'package:instagram_layout_clean/widget/widget.dart';

import 'navigator.dart';

ListTile headerFeedScreen(HeaderPost header) {
  Size size = Size(50, 50);
  ButtonWidgets iconButtons = ButtonWidgets();
  return ListTile(
    leading: Container(
        width: size.width,
        height: size.height,
        decoration: shapeCircleShadows(),
        child: circleProfile(header.strImage, size)),
    title: stringBold(
      header.authorName,
    ),
    subtitle: Text(header.timeAgo),
    trailing: iconButtons.more(),
  );
}

class ButtomFeedImages extends StatelessWidget {
  final Post post;
  const ButtomFeedImages({Key key, this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ButtonWidgets buttonIcon = ButtonWidgets();
    return rowsSpaceBetween(
      [
        rows(
          [
            rows(
              [buttonIcon.likePost(), viewLikeCommant(100)],
            ),
            SizedBox(width: 20.0),
            rows(
              [
                buttonIcon.commandPost(context, post),
                viewLikeCommant(
                  100,
                ),
              ],
            ),
          ],
        ),
        buttonIcon.bookmarkBorder()
      ],
    );
  }
}

Padding instagramHeaders() {
  ButtonWidgets buttonIcon = ButtonWidgets();
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    child: rowsSpaceBetween(
      [
        instagramText(),
        rows(
          [buttonIcon.liveTv(), SizedBox(width: 16.0), buttonIcon.send()],
        )
      ],
    ),
  );
}

ListView listProfile(List<String> stories) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: stories.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        margin: EdgeInsets.all(10.0),
        width: 60.0,
        height: 60.0,
        decoration: shapeCircleShadows(),
        child: circleProfile(stories[index], Size(60, 60)),
      );
    },
  );
}

// Semua bagian Post dari kepala, foto , dan kaki
class BuildPostScreen extends StatelessWidget {
  final List<Post> listPost;
  const BuildPostScreen({Key key, this.listPost}) : super(key: key);

  Padding entriesPost(BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        width: double.infinity,
        height: 560.0,
        decoration: circularWhite(),
        child: Padding(
          padding: verticalW(10.0),
          child: columns(
            [
              headerFeedScreen(HeaderPost(
                  strImage: posts[index].authorImageUrl,
                  authorName: posts[index].authorName,
                  timeAgo: posts[index].timeAgo)),
              InkWell(
                onDoubleTap: () => print('Like post'),
                onTap: () => goToPostView(context, posts[index]),
                child: tileImageList(posts[index].imageUrl),
              ),
              Padding(
                  padding: horizonW(20),
                  child: ButtomFeedImages(post: posts[index])),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: listPost
          .map((e) => entriesPost(context, listPost.indexOf(e)))
          .toList(),
    );
  }
}

class BuildPostCommanScreen extends StatelessWidget {
  final Post post;
  BuildPostCommanScreen(this.post);
  final buttonWidgets = ButtonWidgets();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: verticalW(10),
      child: columns(
        [
          rowsSpaceBetween(
            [
              buttonWidgets.arrowback(context),
              Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: headerFeedScreen(HeaderPost(
                      authorName: post.authorName,
                      strImage: post.authorImageUrl,
                      timeAgo: post.timeAgo))),
            ],
          ),
          InkWell(
            onDoubleTap: () => print('Like post'),
            child: tileImageList(post.imageUrl),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ButtomFeedImages()),
        ],
      ),
    );
  }
}

Widget commandView(List<Comment> comments) {
  // command per part
  Widget _buildComment(Comment comments) {
    ButtonWidgets buttonWidgets = ButtonWidgets();
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: ListTile(
          leading: Container(
              width: 50.0,
              height: 50.0,
              decoration: shapeCircleShadows(),
              child: circleProfile(comments.authorImageUrl, Size(50, 50))),
          title: stringBold(
            comments.authorName,
          ),
          subtitle: Text(comments.text),
          trailing: buttonWidgets.likePost()),
    );
  }

  return Container(
      width: double.infinity,
      height: 600.0,
      decoration: whiteTopRadius(),
      child: Column(
        children: comments
            .map((e) => _buildComment(comments[comments.indexOf(e)]))
            .toList(),
      ));
}
