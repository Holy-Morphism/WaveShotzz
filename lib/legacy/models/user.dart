import 'dart:developer';
import 'dart:typed_data';

import 'package:kylipp/legacy/models/post.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import '../firebase/database.dart';
import '../firebase/storage.dart';

class User {
  final String uid;
  final String username;
  final String email;
  final String password;
  final String photoUrl;
  final String bio;
  final List followers;
  final List following;
  final List posts;
  final Map chats;

  const User(
      {required this.uid,
      required this.username,
      required this.email,
      required this.password,
      required this.bio,
      required this.followers,
      required this.following,
      required this.photoUrl,
      required this.posts,
      this.chats = const {}});

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'password': password,
      'username': username,
      'photoUrl': photoUrl,
      'bio': bio,
      'following': following,
      'followers': followers,
      'posts': posts,
      'chats': chats,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'],
      email: json['email'],
      password: json['password'],
      username: json['username'],
      photoUrl: json['photoUrl'],
      bio: json['bio'],
      following: json['following'],
      followers: json['followers'],
      posts: json['posts'],
      chats: json['chats'],
    );
  }

  void addFollowing(String uid) {
    if (isFollowing(uid)) {
      return;
    }
    following.add(uid);
    Database.addFollowing(uid);
  }

  void removeFollowing(String uid) {
    if (isFollowing(uid)) {
      following.remove(uid);
      Database.removeFollowing(uid);
    }
  }

  bool isFollowing(String uid) {
    return following.contains(uid);
  }

  static void postPicture(
      {required Uint8List post,
      required bool isVideo,
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
            likes: [],
            isVideo: isVideo));
  }

  types.User typeUser() {
    return types.User(
      id: uid,
      imageUrl: photoUrl,
      firstName: username,
    );
  }
}
