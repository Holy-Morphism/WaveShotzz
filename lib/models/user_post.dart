import 'package:kylipp/models/post.dart';

import '../firebase/database.dart';

class UserPost {
  final String username;
  final String uid;
  final Post post;
  const UserPost({
    required this.username,
    required this.uid,
    required this.post,
  });

  void like(String userUid) {
    if (!isLiked(userUid)) {
      post.likes.add(userUid);
      Database.likePhoto(uid: uid, dateTime: post.date);
    }
  }

  void unLike(String userUid) {
    if (isLiked(userUid)) {
      post.likes.remove(userUid);
      Database.dislikePhoto(uid: uid, dateTime: post.date);
    }
  }

  bool isLiked(String uid) {
    return post.likes.contains(uid);
  }
}
