import 'dart:typed_data';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, String>> signInUser(
      {required String username,
      required String email,
      required String password,
      Uint8List? image,
      String? bio});

  Future<Either<Failure, void>> logInUser({
    required String email,
    required String password,
  });
}
