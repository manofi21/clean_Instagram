class SaveComment {
  int id;
  int id_photo;
  int from_id_user;
  String commant;

  SaveComment({this.id, this.id_photo, this.from_id_user, this.commant});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'id_photo': id_photo,
      'from_id_user': from_id_user,
      'commant': commant
    };
    return map;
  }

  SaveComment.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    id_photo = map['id_photo'];
    from_id_user = map['from_id_user'];
    commant = map['commant'];
  }
}

class Comment {
  int id_photo;
  String commantProfile;
  String commantUsername;
  String commant;

  Comment(
      {this.id_photo, this.commantProfile, this.commantUsername, this.commant});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id_photo': id_photo,
      'commantProfile': commantProfile,
      'commantUsername': commantUsername,
      'commant': commant
    };
    return map;
  }

  Comment.fromMap(Map<String, dynamic> map) {
    id_photo = map['id_photo'];
    commantProfile = map['commantProfile'];
    commantUsername = map['commantUsername'];
    commant = map['commant'];
  }
}
