import 'package:flutter/widgets.dart';

class UserProfileEntity {
  final String name;
  final NetworkImage image;
  final String bio;
  final int followers;
  final int following;
  final List<PostEntity> posts;
}
