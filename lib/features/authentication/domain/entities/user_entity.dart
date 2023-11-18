// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
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

  const UserEntity(
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

  @override
  List<Object> get props {
    return [
      uid,
      username,
      email,
      password,
      photoUrl,
      bio,
      followers,
      following,
      posts,
      chats,
    ];
  }
}
