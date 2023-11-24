import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:kylipp/core/constants/constants.dart';
import 'package:kylipp/core/error/failure.dart';
import 'package:kylipp/core/shared/models/user_model.dart';
import 'package:kylipp/features/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImplementation
    implements AuthenticationRepository {
  final FirebaseAuth _auth;
  final FirebaseFirestore _database;
  final FirebaseStorage _storage;
  AuthenticationRepositoryImplementation(
      this._auth, this._database, this._storage);
  @override
  bool isSignedIn() {
    if (_auth.currentUser != null) {
      return true;
    }
    return false;
  }

  @override
  Future<Either<Failure, void>> logInUser(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return const Right(null);
    } catch (e) {
      return Left(LogInFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signInUser(
      {required String username,
      required String email,
      required String password,
      Uint8List? image,
      String? bio}) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      String? url;
      final uid = credential.user!.uid;
      if (image != null) {
        final Reference path = _storage.ref('$uid$profilePicturePath');
        await path.putData(image);
        url = await path.getDownloadURL();
      }
      final user = UserModel(
          uid: uid,
          username: username,
          email: email,
          password: password,
          bio: bio,
          photoUrl: url);

      await _database.collection('users').doc(uid).set(user.toJson());
      return const Right(null);
    } catch (e) {
      return Left(SignInFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      return Right(await _auth.signOut());
    } catch (e) {
      return Left(SignOutFailure(e.toString()));
    }
  }
}
