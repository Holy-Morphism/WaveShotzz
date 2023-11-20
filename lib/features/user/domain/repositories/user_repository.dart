import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:kylipp/core/error/failure.dart';
import 'package:kylipp/core/shared/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getUser();
  Future<Either<Failure, void>> upLoadPost(
      {required Uint8List post, required String caption});
  Future<Either<Failure, void>> follow({required String uid});
  Future<Either<Failure, void>> unfollow({required String uid});
  Future<Either<Failure, void>> likePhoto(
      {required String uid, required DateTime dateTime});
}
