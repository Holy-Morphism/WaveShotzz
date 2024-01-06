import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waveshotzz/core/error/failure.dart';
import 'package:waveshotzz/features/user_profile/data/models/user_profile_model.dart';
import 'package:waveshotzz/features/user_profile/data/repositories/user_profile_repository_implementation.dart.dart';

void main() {
  late MockFirebaseStorage mockFirebaseStorage;
  late MockFirebaseAuth mockFirebaseAuth;
  late FakeFirebaseFirestore fakeFirebaseFirestore;
  late UserProfileRepositoryImplementation userProfileRepositoryImplementation;
  setUp(() {
    mockFirebaseStorage = MockFirebaseStorage();
    mockFirebaseAuth = MockFirebaseAuth();
    fakeFirebaseFirestore = FakeFirebaseFirestore();

    userProfileRepositoryImplementation = UserProfileRepositoryImplementation(
        mockFirebaseAuth, fakeFirebaseFirestore, mockFirebaseStorage);
  });

  const String email = 'user@gmail.com';
  const String password = 'password123';

  mockFirebaseAuth.signInWithEmailAndPassword(email: email, password: password);

  const UserProfileModel user = UserProfileModel(
    name: 'user',
    profilePictureUrl: 'profilePictureUrl',
    posts: [],
  );
  const String picPath = '/profile-picture';

  group('Get User data', () {
    test('Get User data successfully', () async {
      //arrange
      fakeFirebaseFirestore
          .collection('users')
          .doc(mockFirebaseAuth.currentUser!.uid)
          .set({'name': user.name, 'profileUrl': user.profilePictureUrl});
      final Reference path = mockFirebaseStorage
          .ref('${mockFirebaseAuth.currentUser!.uid}$picPath');
      await path.putData(Uint8List.fromList([1, 2, 3, 4, 5]));
      fakeFirebaseFirestore
          .collection('users')
          .doc(mockFirebaseAuth.currentUser!.uid)
          .set({'profileUrl': await path.getDownloadURL()});
      //act
      final result = userProfileRepositoryImplementation.getUser();

      //assert
      expect(result, equals(const Right(user)));
    });

    test('Get User Data fails', () {
      //arrange
      fakeFirebaseFirestore
          .collection('comments')
          .doc(mockFirebaseAuth.currentUser!.uid)
          .set({'name': user.name, 'profileUrl': user.profilePictureUrl});

      //act
      final result = userProfileRepositoryImplementation.getUser();

      //assert
      expect(result,
          equals(const Left(GetUserFailure('failed to get user data'))));
    });
  });

  group('Delete user', () {
    test('delete user succsesful', () {
      //arrange
      fakeFirebaseFirestore
          .collection('users')
          .doc(mockFirebaseAuth.currentUser!.uid)
          .set({'name': user.name, 'profileUrl': user.profilePictureUrl});

      //act
      final result = userProfileRepositoryImplementation.deleteUser();

      //assert
      expect(result, equals(const Right(null)));
    });

    test('Get User Data fails', () {
      //arrange
      fakeFirebaseFirestore
          .collection('comments')
          .doc(mockFirebaseAuth.currentUser!.uid)
          .set({'name': user.name, 'profileUrl': user.profilePictureUrl});

      //act
      final result = userProfileRepositoryImplementation.deleteUser();

      //assert
      expect(result,
          equals(const Left(GetUserFailure('failed to get user data'))));
    });
  });
}
