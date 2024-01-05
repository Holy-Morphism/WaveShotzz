import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:waveshotzz/core/error/failure.dart';

import 'package:waveshotzz/features/user_profile/domain/enitities/user_profile_entity.dart';

import '../../domain/repositories/user_profile_repository.dart';

class UserProfileRepositoryImplementation implements UserProfileRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseStorage _firebaseStorage;
  @override
  Future<Either<Failure, void>> deleteUser() {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Stream<Either<Failure, UserProfileEntity>> getUser() {}
}
