// import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:last_instagram/model/comment.dart';
import 'package:last_instagram/model/image_str.dart';
import 'dbHelper.dart';
import 'package:last_instagram/model/Users.dart';
import 'package:last_instagram/model/post.dart';

/*
OLD BUT GOLD
void pickProfile(GetASet getSet) {
  final _picker = ImagePicker();
  _picker.getImage(source: ImageSource.gallery).then((imgFile) async {
    getSet.str_name = Utility.base64String(await imgFile.readAsBytes());
  });
  // return imgString;
}
 */

Future<void> pickImage(GetASet getSet) async {
  final _picker = ImagePicker();
  await _picker.getImage(source: ImageSource.gallery).then((imgFile) async {
    getSet.str_name = Utility.base64String(await imgFile.readAsBytes());
  });
}

// Future<void> postImages(GetASet getASet, int id) async {
//   DBHelper help = DBHelper();
//   var now = new DateTime.now();
//   final timeNow = DateFormat("HH:mm:ss").format(now);
//   await pickImage(getASet).then((value) {
//     // print(getASet.str_name);
//     print(id);
//     help.postImages(
//         SavePost(id_author: id, image: getASet.str_name, timeAgo: timeNow));
//   });
// }

void postComment(SaveComment comment) {
  DBHelper help = DBHelper();
  help
      .addcomment(comment)
      .then((value) => print(value.commant + " " + value.id.toString()));
}

void register(GetASet getASet, String username, String password) async {
  DBHelper help = DBHelper();
  pickImage(getASet).then((value) {
    print(getASet.str_name);
    help.adduser(
        Users(img: getASet.str_name, username: username, password: password));
  });
}

Future<int> loginUser(String username, String password) async {
  DBHelper help = DBHelper();
  Users dataUsers = await help.loginUser(username, password);
  int id = dataUsers.id;
  return id;
}

Future<Users> getUserProf(int i) async {
  DBHelper help = DBHelper();
  Users getUser = await help.selectUserFromId(i);
  print(getUser.username);
  return getUser;
}

Future<List<Post>> getPost() async {
  DBHelper help = DBHelper();
  List<SavePost> lPost = await help.seePost();
  print(lPost.length);
  List<Post> sPost = [];
  for (int i = 0; i < lPost.length; i++) {
    Users getUser = await getUserProf(lPost[i].id_author);
    print(getUser.username);
    Post rPost = Post(
        id: lPost[i].id,
        authorName: getUser.username,
        authorProfile: getUser.img,
        image: lPost[i].image,
        timeAgo: lPost[i].timeAgo);
    sPost.add(rPost);
  }
  return sPost;
}

Future<List<Comment>> getComment(int id) async {
  DBHelper help = DBHelper();
  List<SaveComment> saveComment = await help.selectComment(id);
  List<Comment> getComment = [];
  for (int i = 0; i < saveComment.length; i++) {
    SaveComment aSaveCommant = saveComment[i];
    Users getUser = await getUserProf(aSaveCommant.from_id_user);
    Comment aComment = Comment(
        id_photo: aSaveCommant.id_photo,
        commant: aSaveCommant.commant,
        commantProfile: getUser.img,
        commantUsername: getUser.username);
    getComment.add(aComment);
  }
  return getComment;
}

class Utility {
  static Image imageFromBase64String(String base64String) {
    return Image.memory(
      base64Decode(base64String),
      fit: BoxFit.fill,
    );
  }

  static Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  static String base64String(Uint8List data) {
    return base64Encode(data);
  }
}
