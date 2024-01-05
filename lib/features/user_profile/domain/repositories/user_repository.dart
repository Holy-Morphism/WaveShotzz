import 'package:dartz/dartz.dart';
import 'package:waveshotzz/core/error/failure.dart';

import '../entities/user_profile_entity.dart';

abstract class UserProfileRepository {
  Stream<Either<Failure, UserProfileEntity>> getUser();
}
