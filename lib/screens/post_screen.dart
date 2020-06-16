import 'package:flutter/material.dart';
import 'package:last_instagram/method/method.dart';
import 'package:last_instagram/model/Users.dart';
import 'package:last_instagram/model/comment.dart';
import 'package:last_instagram/model/post.dart';
import 'package:last_instagram/state_container.dart';
import 'package:last_instagram/widget/button_icon.dart';
import 'package:last_instagram/widget/midle_widget.dart';
import 'package:last_instagram/widget/widget.dart';

class ViewPostScreen extends StatefulWidget {
  final Post post;

  ViewPostScreen({this.post});

  @override
  _ViewPostScreenState createState() => _ViewPostScreenState();
}

class _ViewPostScreenState extends State<ViewPostScreen> {
  ButtonWidgets buttonWidgets = ButtonWidgets();
  TextEditingController textController;
  final formKey = new GlobalKey<FormState>();
  String commants;
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final container = StateContainer.of(context);
    int id = container.index;
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
                child: BuildPostCommanScreen(widget.post)),
            SizedBox(height: 10.0),
            Container(
                width: double.infinity,
                height: 600.0,
                decoration: whiteTopRadius(),
                child: StreamBuilder(
                    stream: getComment(widget.post.id).asStream(),
                    builder: (context, snapshot) {
                      if (snapshot.data != null) {
                        return commandView(snapshot.data);
                      }
                      return Container();
                    }))
          ],
        ),
      ),
      bottomNavigationBar: Transform.translate(
        offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: 100.0,
          decoration: boxShadowBorderRadius(),
          child: Form(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: TextFormField(
                controller: textController,
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
                      child: FutureBuilder<Users>(
                          future: getUserProf(id),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return circleProfile(
                                  snapshot.data.img, Size(48, 48));
                            }
                            return Container();
                          })),
                  suffixIcon: Container(
                      margin: EdgeInsets.only(right: 4.0),
                      width: 70.0,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        color: Color(0xFF23B66F),
                        onPressed: () {
                          // print(textController.text);
                          SaveComment saves = SaveComment(
                            commant: textController.text,
                            from_id_user: id,
                            id_photo: widget.post.id,
                          );
                          print(saves.commant);
                          postComment(saves);
                        },
                        child: Icon(
                          Icons.send,
                          size: 25.0,
                          color: Colors.white,
                        ),
                      )),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
