import 'package:waveshotzz/features/user_profile/domain/enitities/user_profile_entity.dart';

class UserProfileMode extends UserProfileEntity {
  const UserProfileMode(
      {required super.name,
      required super.profilePicture,
      required super.posts});

  factory UserProfileMode.fromJson(Map<String, dynamic> json) {
    return UserProfileMode(
      name: json['name'],
      profilePicture: json['profilePicture'],
      posts: json['posts'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'profilePicture': profilePicture,
      'posts': posts,
    };
  }
}
