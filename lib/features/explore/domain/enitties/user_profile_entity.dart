// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'post_entity.dart';

class UserProfileEntity extends Equatable {
  final String username;
  final String id;
  final String url;
  final String bio;
  final int followers;
  final int following;
  final int postCount;
  final bool isFollowing;
  final List<PostEntity> posts;
  const UserProfileEntity({
    required this.username,
    required this.id,
    required this.url,
    required this.bio,
    required this.followers,
    required this.following,
    required this.postCount,
    required this.isFollowing,
    required this.posts,
  });

  @override
  List<Object> get props {
    return [
      username,
      id,
      url,
      bio,
      followers,
      following,
      postCount,
      isFollowing,
      posts,
    ];
  }
}
