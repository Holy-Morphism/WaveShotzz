import 'package:dartz/dartz.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waveshotzz/core/error/failure.dart';
import 'package:waveshotzz/features/user_profile/data/models/user_profile_model.dart';
import 'package:waveshotzz/features/user_profile/data/repositories/user_profile_repository_implementation.dart.dart';

void main() {
  const String email = 'user@gmail.com';
  const String password = 'password123';

  late MockFirebaseStorage mockFirebaseStorage;
  late MockFirebaseAuth mockFirebaseAuth;
  late FakeFirebaseFirestore fakeFirebaseFirestore;
  late UserProfileRepositoryImplementation userProfileRepositoryImplementation;
  setUp(() {
    mockFirebaseStorage = MockFirebaseStorage();
    mockFirebaseAuth = MockFirebaseAuth();
    fakeFirebaseFirestore = FakeFirebaseFirestore();
    mockFirebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    userProfileRepositoryImplementation = UserProfileRepositoryImplementation(
        mockFirebaseAuth, fakeFirebaseFirestore, mockFirebaseStorage);
  });

  const UserProfileModel user = UserProfileModel(
    name: 'user',
    profilePictureUrl: 'profilePictureUrl',
    posts: [],
  );

  group('Get User data', () {
    test('Get User data successfully', () {
      //arrange
      fakeFirebaseFirestore
          .collection('users')
          .doc(mockFirebaseAuth.currentUser!.uid)
          .set({
        'username': user.name,
        'profilePictureUrl': user.profilePictureUrl
      });

      //act
      final result = userProfileRepositoryImplementation.getUser();

      //assert
      expect(result, emitsInOrder([const Right(user)]));
    });

    test('Get User Data fails', () {
      //arrange
      fakeFirebaseFirestore.collection('comments').doc('12345').set(
          {'username': user.name, 'profilePictureUrl': user.profilePictureUrl});

      //act
      final result = userProfileRepositoryImplementation.getUser();

      //assert
      expect(result,
          emitsInOrder([const Left(RandomFailure('failed to get user data'))]));
    });
  });

  group('Delete user', () {
    test('delete user succsesful', () async {
      //arrange
      fakeFirebaseFirestore
          .collection('users')
          .doc(mockFirebaseAuth.currentUser!.uid)
          .set({
        'username': user.name,
        'profilePictureUrl': user.profilePictureUrl
      });

      //act
      final result = await userProfileRepositoryImplementation.deleteUser();

      //assert
      expect(result, equals(const Right(null)));
    });

    // test('delete user fails', () async {
    //   //arrange
    //   fakeFirebaseFirestore
    //       .collection('users')
    //       .doc(mockFirebaseAuth.currentUser!.uid)
    //       .set({
    //     'username': user.name,
    //     'profilePictureUrl': user.profilePictureUrl
    //   });

    //   //act
    //   final result = await userProfileRepositoryImplementation.deleteUser();

    //   //assert
    //   expect(
    //       result, equals(const Left(RandomFailure('Failed to Delete user'))));
    // });
  });
}
