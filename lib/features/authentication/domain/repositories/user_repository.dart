import 'package:dartz/dartz.dart';
import 'package:kylipp/core/error/failure.dart';
import 'package:kylipp/features/authentication/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getUser();
  Future<Either<Failure, void>> upLoadPost(post, data);
}
