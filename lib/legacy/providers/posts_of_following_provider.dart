import 'package:flutter/foundation.dart';
import 'package:kylipp/legacy/firebase/database.dart';
import 'package:kylipp/legacy/models/user_post.dart';

class PostOfFollowingProvider with ChangeNotifier {
  List<UserPost>? _posts;

  PostOfFollowingProvider() {
    refreshPosts();
  }

  void refreshPosts() async {
    _posts = await Database.getPostsOfFollowing();
    notifyListeners();
  }

  List<UserPost>? get posts => _posts;
}
