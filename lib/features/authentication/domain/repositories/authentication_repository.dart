import 'dart:typed_data';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, void>> signInUser(
      {required String username,
      required String email,
      Uint8List? image,
      String? bio});
  bool isSignedIn();
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, void>> logInUser({
    required String username,
    required String email,
  });
}
