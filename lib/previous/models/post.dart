class Post {
  final String photoUrl;
  final String caption;
  final DateTime date;
  final List likes;
  final bool isVideo;
  const Post({
    required this.photoUrl,
    required this.caption,
    required this.date,
    required this.likes,
    this.isVideo = false,
  });
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        photoUrl: json['photoUrl'] as String,
        caption: json['caption'] as String,
        date: DateTime.parse(json['date'] as String),
        likes: json['likes'],
        isVideo: json['isVideo']);
  }

  Map<String, dynamic> toJson() {
    return {
      'photoUrl': photoUrl,
      'caption': caption,
      'date': date.toString(),
      'likes': likes,
      'isVideo': isVideo,
    };
  }
}
