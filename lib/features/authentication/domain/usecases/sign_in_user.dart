import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:waveshotzz/core/error/failure.dart';

import '../repositories/authentication_repository.dart';

class SignInUser {
  final AuthenticationRepository _authenticationRepository;
  SignInUser(this._authenticationRepository);

  Future<Either<Failure, String>> call({
    required String username,
    required String email,
    required String password,
    Uint8List? image,
    String? bio,
  }) {
    return _authenticationRepository.signInUser(
        username: username,
        email: email,
        password: password,
        image: image,
        bio: bio);
  }
}
