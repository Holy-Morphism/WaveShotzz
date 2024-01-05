import 'package:dartz/dartz.dart';

import 'package:waveshotzz/core/error/failure.dart';

import 'package:waveshotzz/features/user_profile/domain/entities/user_profile_entity.dart';

class UserProfileRepositoryImplementation implements UserProfileRepository {
  @override
  Stream<Either<Failure, UserProfileEntity>> getUser() {}

  @override
  Future<Either<Failure, void>> deleteUser() {
    throw UnimplementedError();
  }
}
