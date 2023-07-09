import 'package:kylipp/models/post.dart';

class ExplorePost {
  final String username;
  final String uid;
  final Post post;
  const ExplorePost({
    required this.username,
    required this.uid,
    required this.post,
  });
}
