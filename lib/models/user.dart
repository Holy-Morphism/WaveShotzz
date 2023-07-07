class User {
  final String username;
  final String email;
  final String password;
  final String profilePictureUrl;
  final String bio;
  final List followers;
  final List following;
  final List posts;

  const User(
      {required this.username,
      required this.email,
      required this.password,
      required this.bio,
      required this.followers,
      required this.following,
      required this.profilePictureUrl,
      required this.posts});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'username': username,
      'profilePictureUrl': profilePictureUrl,
      'bio': bio,
      'following': following,
      'followers': followers,
      'posts': posts,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      password: json['password'],
      username: json['username'],
      profilePictureUrl: json['profilePictureUrl'],
      bio: json['bio'],
      following: json['following'],
      followers: json['followers'],
      posts: json['posts'],
    );
  }
}
