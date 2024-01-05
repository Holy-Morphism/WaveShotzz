import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/shared/user/domain/enities/post_entity.dart';

class UserProfileEntity extends Equatable {
  final String name;
  final MemoryImage profilePicture;
  final List<PostEntity> posts;

  const UserProfileEntity({
    required this.name,
    required this.profilePicture,
    required this.posts,
  });

  @override
  List<Object> get props => [name, profilePicture, posts];
}
