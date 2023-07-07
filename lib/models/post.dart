class Post {
  final String photoUrl;
  final String caption;
  final DateTime date;
  final int likes, dislikes;
  const Post({
    required this.photoUrl,
    required this.caption,
    required this.date,
    required this.dislikes,
    required this.likes,
  });
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      photoUrl: json['photoUrl'] as String,
      caption: json['caption'] as String,
      date: DateTime.parse(json['date'] as String),
      likes: json['likes'] as int,
      dislikes: json['dislikes'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'photoUrl': photoUrl,
      'caption': caption,
      'date': date.toString(),
      'likes': likes,
      'dislikes': dislikes,
    };
  }
}
