import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:kylipp/core/error/failure.dart';

import '../repositories/authentication_repository.dart';

class SignInUser {
  final AuthenticationRepository _authenticationRepository;
  SignInUser(this._authenticationRepository);

  Future<Either<Failure, void>> call({
    required String username,
    required String email,
    Uint8List? image,
    String? bio,
  }) {
    return _authenticationRepository.signInUser(
        username: username, email: email, image: image, bio: bio);
  }
}
