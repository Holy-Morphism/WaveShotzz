import 'dart:typed_data';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, void>> signInUser(
      {required String username,
      required String email,
      required String password,
      Uint8List? image,
      String? bio});
  bool isSignedIn();
  Future<void> signOut();
  Future<Either<Failure, void>> logInUser({
    required String email,
    required String password,
  });
}
