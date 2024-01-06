import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:waveshotzz/core/error/failure.dart';
import 'package:waveshotzz/core/shared/user/data/models/post_model.dart';
import 'package:waveshotzz/core/shared/user/domain/entities/post_entity.dart';
import 'package:waveshotzz/features/user_profile/data/models/user_profile_model.dart';

import 'package:waveshotzz/features/user_profile/domain/entities/user_profile_entity.dart';

import '../../domain/repositories/user_profile_repository.dart';

class UserProfileRepositoryImplementation implements UserProfileRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseStorage _firebaseStorage;

  UserProfileRepositoryImplementation(
      this._firebaseAuth, this._firebaseFirestore, this._firebaseStorage);

  @override
  Future<Either<Failure, void>> deleteUser() async {
    try {
      _firebaseStorage.ref('users/${_firebaseAuth.currentUser!.uid}').delete();
      return _firebaseFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .delete()
          .then((value) => const Right(null));
    } catch (e) {
      return const Left(RandomFailure('Failed to Delete user'));
    }
  }

  @override
  Stream<Either<Failure, UserProfileEntity>> getUser() async* {
    try {
      final userStream = _firebaseFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .snapshots();

      final Stream<List<PostEntity>> postStream = _firebaseFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection('posts')
          .snapshots()
          .map((event) =>
              event.docs.map((e) => PostModel.fromJson(e.data())).toList());

      await for (var user in userStream) {
        await for (var posts in postStream) {
          final Map<String, dynamic> data = user.data()!;
          data.addAll({'posts': posts});
          yield (Right(UserProfileModel.fromJson(data)));
        }
      }
    } catch (e) {
      yield const Left(RandomFailure('failed to get user data'));
    }
  }
}
