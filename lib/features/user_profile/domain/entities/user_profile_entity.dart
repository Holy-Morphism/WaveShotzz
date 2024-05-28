import 'package:equatable/equatable.dart';

import '../../../../core/shared/user/domain/entities/post_entity.dart';

class UserProfileEntity extends Equatable {
  final String name;
  final String profilePictureUrl;
  final int followers;
  final int following;
  final List<PostEntity> posts;

  const UserProfileEntity({
    required this.name,
    required this.profilePictureUrl,
    required this.posts,
    required this.followers,
    required this.following,
  });

  @override
  List<Object> get props =>
      [name, profilePictureUrl, posts, followers, following];
}
