import 'package:waveshotzz/core/shared/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
      {required super.uid,
      required super.username,
      required super.email,
      required super.password,
      super.bio,
      super.followers,
      super.following,
      super.photoUrl,
      super.posts});

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
        uid: map['uid'],
        username: map['username'],
        email: map['email'],
        password: map['password'],
        bio: map['bio'],
        followers: map['followers'],
        following: map['following'],
        photoUrl: map['photoUrl'],
        posts: map['posts']);
  }
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'username': username,
      'email': email,
      'password': password,
      'bio': bio,
      'followers': followers,
      'following': following,
      'photoUrl': photoUrl,
      'posts': posts,
    };
  }
}
