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
}
