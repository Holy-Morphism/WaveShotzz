import 'package:dartz/dartz.dart';
import 'package:waveshotzz/core/error/failure.dart';
import 'package:waveshotzz/core/shared/user/domain/entities/user_entity.dart';

abstract class UserProfileRepository {
  Future<Either<Failure, UserEntity>> getUser();
}
