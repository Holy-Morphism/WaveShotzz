import 'package:waveshotzz/core/shared/user/domain/entities/post_entity.dart';
import 'package:waveshotzz/features/user_profile/domain/entities/user_profile_entity.dart';

class UserProfileModel extends UserProfileEntity {
  const UserProfileModel(
      {required super.name,
      required super.profilePictureUrl,
      required super.posts});

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      name: json['name'] ?? '',
      profilePictureUrl: json['profilePicture'] ?? '',
      posts: json['posts'] ?? <PostEntity>[],
    );
  }
}
