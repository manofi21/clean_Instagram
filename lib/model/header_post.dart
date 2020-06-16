class HeaderPost {
  String strImage;
  String authorName;
  String timeAgo;

  HeaderPost({
    this.strImage,
    this.authorName,
    this.timeAgo,
  });

  factory HeaderPost.fromJson(Map<String, dynamic> json) => HeaderPost(
    strImage: json["strImage"],
    authorName: json["authorName"],
    timeAgo: json["timeAgo"]
  );

  Map<String, dynamic> toJson() => {
    "strImage" : strImage,
    "authorName" : authorName,
    "timeAgo" : timeAgo
  };
}