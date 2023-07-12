import 'package:flutter/material.dart';
import 'package:kylipp/firebase/database.dart';

import '../models/explore_post.dart';

class HomePostProvider with ChangeNotifier {
  List<ExplorePost>? _posts;

  void getFollowersPost() async {
    _posts = await Database.getPostsOfFollowing();
    if (_posts != null) {
      _posts?.sort((a, b) => a.post.date.compareTo(b.post.date));
    }
    notifyListeners();
  }

  List<ExplorePost>? get posts => _posts;
}
