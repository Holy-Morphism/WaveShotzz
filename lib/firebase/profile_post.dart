import 'dart:developer';
import 'dart:typed_data';

import 'package:kylipp/firebase/database.dart';
import 'package:kylipp/firebase/storage.dart';
import 'package:kylipp/models/post.dart';

class ProfilePost {
  static void postPicture(
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
  }
}
