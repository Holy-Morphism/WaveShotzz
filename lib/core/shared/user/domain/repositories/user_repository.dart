import 'dart:typed_data';

import 'package:dartz/dartz.dart';

import '../../../../error/failure.dart';

abstract class UserRepository {
  Future<Either<Failure, void>> upLoadPost(
      {required Uint8List post, required String caption});
  Future<Either<Failure, void>> follow({required String uid});
  Future<Either<Failure, void>> unfollow({required String uid});
  Future<Either<Failure, void>> likePhoto({required String uid});
  Future<Either<Failure, void>> unlikePhoto({required String uid});
  Future<Either<Failure, void>> commentPhoto(
      {required String uid,
      required String comment,
      required DateTime dateTime});
  Future<Either<Failure, void>> deleteComment(
      {required String uid, required String commentId});
}
