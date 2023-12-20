import 'package:flutter/material.dart';
import 'package:waveshotzz/legacy/models/user_post.dart';
import 'package:waveshotzz/legacy/models/post.dart';
import 'package:waveshotzz/legacy/models/user.dart';

import '../firebase/database.dart';

class UsersProvider with ChangeNotifier {
  List<User>? _users;

  UsersProvider() {
    refreshUsers();
  }

  void refreshUsers() async {
    _users = await Database.getUsers();
    notifyListeners();
  }

  List<User>? get users => _users;

  List<UserPost> get explorePosts {
    List<UserPost> posts = [];
    if (users != null) {
      for (User user in _users!) {
        for (Map<String, dynamic> post in user.posts) {
          posts.add(UserPost(
              username: user.username,
              uid: user.uid,
              post: Post.fromJson(post)));
        }
      }
    }

    return posts;
  }

  User? getData(String username) {
    if (users != null) {
      return users!.firstWhere((element) =>
          element.username.substring(0, username.length) == username);
    }
    return null;
  }
}
