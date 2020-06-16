class Post {
  int id;
  String image;
  String timeAgo;
  String authorName;
  String authorProfile;

  Post({
    this.id,
    this.image,
    this.timeAgo,
    this.authorName,
    this.authorProfile,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id' : id,
      'image': image,
      'timeAgo': timeAgo,
      'authorName': authorName,
      'authorProfile': authorProfile
    };
    return map;
  }

  Post.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    image = map['image'];
    timeAgo = map['timeAgo'];
    authorName = map['authorName'];
    authorProfile = map['authorProfile'];
  }
}

class SavePost {
  int id;
  int id_author;
  String timeAgo;
  String image;

  SavePost({this.id, this.id_author, this.timeAgo, this.image});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'id_author': id_author,
      'timeAgo': timeAgo,
      'image': image
    };
    return map;
  }

  SavePost.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    id_author = map['id_author'];
    timeAgo = map['timeAgo'];
    image = map['image'];
  }
}

final List<String> stories = [
  'assets/images/komandro.png',
  'assets/images/alfi.jpg',
  'assets/images/gipey.JPG',
  'assets/images/yopii.JPG',
  'assets/images/nico.JPG',
  'assets/images/anas.JPG',
  'assets/images/nata.JPG',
];
