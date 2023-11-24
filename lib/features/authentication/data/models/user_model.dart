import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.uid,
    required super.username,
    required super.email,
    required super.password,
    super.profilePictureUrl,
    super.bio,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      username: map['username'],
      email: map['email'],
      password: map['password'],
      bio: map['bio'],
      profilePictureUrl: map['profilePictureUrl'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'username': username,
      'email': email,
      'password': password,
      'bio': bio,
      'profilePictureUrl': profilePictureUrl,
    };
  }
}
