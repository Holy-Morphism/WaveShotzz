import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:kylipp/firebase/database.dart';

import '../firebase/storage.dart';
import '../models/post.dart';
import '../models/user.dart';

class CurrentUserProvider with ChangeNotifier {
  User? _user;
  void refreshUser() async {
    _user = await Database.currentUser();
    notifyListeners();
  }

  void postPicture(
      {required Uint8List post,
      required String caption,
      required DateTime date,
      required String uid}) async {
    String url = await Storage.uploadPost(post: post, uid: uid, dateTime: date);
    log('post : $url');
    Database.addPost(
        post: Post(
            photoUrl: url,
            caption: caption,
            date: date,
            dislikes: 0,
            likes: 0));
    refreshUser();
  }

  void addFollowing(String uid) {
    if (user != null) {
      if (_user!.following.contains(uid)) {
        return;
      }
      Database.addFollowing(uid);
      refreshUser();
    }
  }

  void removeFollowing(String uid) {
    Database.removeFollowing(uid);
    refreshUser();
  }

  User? get user => _user;
}
