// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
  @override
  List<Object?> get props => [];
}

class AuthenticationSignIn extends AuthenticationEvent {
  final String username;
  final String password;
  final String email;
  final String? bio;
  final Uint8List? image;
  const AuthenticationSignIn({
    required this.username,
    required this.email,
    required this.password,
    this.bio,
    this.image,
  });

  @override
  List<Object?> get props => [username, password, email, bio, image];
}

class AuthenticationLogIn extends AuthenticationEvent {
  final String password;
  final String email;

  const AuthenticationLogIn({
    required this.password,
    required this.email,
  });

  @override
  List<Object> get props => [password, email];
}
