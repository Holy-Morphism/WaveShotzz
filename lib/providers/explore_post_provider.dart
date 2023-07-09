import 'package:flutter/material.dart';
import 'package:kylipp/firebase/database.dart';
import 'package:kylipp/models/explore_post.dart';

class ExplorePostProvider with ChangeNotifier {
  List<ExplorePost>? _explorePosts;
  void refreshExplorPosts() async {
    _explorePosts = await Database.getUsers();
    notifyListeners();
  }

  List<ExplorePost>? get explorePosts => _explorePosts;
}
