// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import 'package:waveshotzz/core/shared/user/domain/entities/post_entity.dart';

class UserProfileEntity extends Equatable {
  final String name;
  final String email;
  final MemoryImage profilePicture;
  final List<PostEntity> posts;

  const UserProfileEntity({
    required this.name,
    required this.email,
    required this.profilePicture,
    required this.posts,
  });

  @override
  List<Object> get props => [name, email, profilePicture, posts];
}
