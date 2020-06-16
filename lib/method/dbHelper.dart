import 'dart:async';
import 'dart:io' as io;

import 'package:last_instagram/model/comment.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'package:last_instagram/model/Users.dart';
import 'package:last_instagram/model/post.dart';

class DBHelper {
  static Database _db;
  // nama database
  static const String DB_NAME = 'database_new_photo.db';
  // id untuk semua table
  static const String ID = 'id';
  // table User
  static const String USERTABLE = 'Usertable';
  static const String IMG_PROFILE = 'img_profile';
  static const String NAME = 'username';
  static const String PASS = 'password';
  // table Image
  static const String POST = 'Post';
  static const String ID_AUTHOR = 'id_author';
  static const String IMAGE = 'image';
  static const String TIMEAGO = 'timeAgo';
  // table commant
  static const String COMMANT = 'commant';
  static const String ID_PHOTO = 'id_photo';
  static const String FROM_ID_USER = 'from_id_user';
  static const String ID_PICTURE = 'id_picture';

  Future<Database> get db async {
    if (null != _db) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    // getApplicationDocumentsDirectory()
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path,
        version: 1, onCreate: _onCreate, onOpen: _onOpens);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $USERTABLE ($ID INTEGER PRIMARY KEY AUTOINCREMENT, $IMG_PROFILE TEXT, $NAME TEXT, $PASS TEXT)");
    await db.execute(
        "CREATE TABLE $POST ($ID INTEGER PRIMARY KEY AUTOINCREMENT, $ID_AUTHOR INTEGER, $TIMEAGO TEXT, $IMAGE TEXT)");
    await db.execute(
        "CREATE TABLE $COMMANT ($ID INTEGER PRIMARY KEY AUTOINCREMENT, $ID_PHOTO INTEGER, $FROM_ID_USER INTEGER, $COMMANT TEXT)");
  }

  _onOpens(Database db) async {
    // await db.execute("DROP TABLE $USERTABLE");
    // await db.execute("DROP TABLE $POST");
    // await db.execute("DROP TABLE $COMMANT");
    
    // await db.execute(
    //     "CREATE TABLE $USERTABLE ($ID INTEGER PRIMARY KEY AUTOINCREMENT, $IMG_PROFILE TEXT, $NAME TEXT, $PASS TEXT)");
    // await db.execute(
    //     "CREATE TABLE $POST ($ID INTEGER PRIMARY KEY AUTOINCREMENT, $ID_AUTHOR INTEGER, $TIMEAGO TEXT, $IMAGE TEXT)");
    // await db.execute(
    //     "CREATE TABLE $COMMANT ($ID INTEGER PRIMARY KEY AUTOINCREMENT, $ID_PHOTO INTEGER, $FROM_ID_USER INTEGER, $COMMANT TEXT)");
  }

  // success
  Future<Users> adduser(Users employee) async {
    var dbClient = await db;
    employee.id = await dbClient.insert(USERTABLE, employee.toMap());
    print(employee.id.toString() + " " + employee.username);
    return employee;
  }

  Future<Users> loginUser(String username, String password) async {
    var dbClient = await db;
    List<Map> count = await dbClient.query(USERTABLE,
        columns: ['$ID', '$NAME', '$PASS'],
        where: '$NAME = ? and $PASS = ?',
        whereArgs: [username, password]);
    if (count.length > 0) {
      print(Users.fromMap(count.first).id);
      return Users.fromMap(count.first);
    }
    return null;
  }

  Future<SavePost> postImages(SavePost postImages) async {
    var dbClient = await db;
    postImages.id = await dbClient.insert(POST, postImages.toMap());
    return postImages;
  }

  Future<List<SavePost>> seePost() async {
    var dbClient = await db;
    List<Map> maps =
        await dbClient.query(POST, columns: [ID, ID_AUTHOR, TIMEAGO, IMAGE]);
    List<SavePost> employees = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        employees.add(SavePost.fromMap(maps[i]));
      }
    }
    return employees;
  }

  Future<Users> selectUserFromId(int id) async {
    var dbClient = await db;
    List<Map> count = await dbClient.query(USERTABLE,
        columns: [ID, IMG_PROFILE, NAME, PASS],
        where: '$ID = ?',
        whereArgs: [id]);
    if (count.length > 0) {
      // print(Users.fromMap(count.first).username);
      return Users.fromMap(count.first);
    }
    return null;
  }

  Future<SaveComment> addcomment(SaveComment commant) async {
    var dbClient = await db;
    commant.id = await dbClient.insert(COMMANT, commant.toMap());
    return commant;
  }

  Future<List<SaveComment>> selectComment(int id) async {
    // ID INTEGER PRIMARY KEY AUTOINCREMENT, $ID_PHOTO INTEGER, $FROM_ID_USER INTEGER, $COMMANT
    var dbClient = await db;
    List<Map> maps = await dbClient.query(COMMANT,
        columns: [ID, ID_PHOTO, FROM_ID_USER, COMMANT],
        where: '$ID_PHOTO = ?',
        whereArgs: [id]);
    List<SaveComment> employees = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        employees.add(SaveComment.fromMap(maps[i]));
      }
    }
    return employees;
  }
}
