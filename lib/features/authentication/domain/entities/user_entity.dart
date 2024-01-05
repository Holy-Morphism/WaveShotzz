import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String uid;
  final String username;
  final String email;
  final String password;
  final String? bio;
  final String? profilePictureUrl;

  const UserEntity({
    required this.uid,
    required this.username,
    required this.email,
    required this.password,
    this.bio,
    this.profilePictureUrl,
  });

  @override
  List<Object?> get props {
    return [
      uid,
      username,
      email,
      password,
      bio,
      profilePictureUrl,
    ];
  }
}
