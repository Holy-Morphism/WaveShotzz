import 'package:dartz/dartz.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kylipp/core/error/failure.dart';
import 'package:kylipp/features/authentication/data/repositories/authentication_repository_implementation.dart';
import 'package:mock_exceptions/mock_exceptions.dart';

void main() {
  late MockFirebaseStorage mockFirebaseStorage;
  late MockFirebaseAuth mockFirebaseAuth;
  late FakeFirebaseFirestore fakeFirebaseFirestore;
  late AuthenticationRepositoryImplementation
      authenticationRepositoryImplementation;
  setUp(() {
    mockFirebaseStorage = MockFirebaseStorage();
    mockFirebaseAuth = MockFirebaseAuth();
    fakeFirebaseFirestore = FakeFirebaseFirestore();

    authenticationRepositoryImplementation =
        AuthenticationRepositoryImplementation(
            mockFirebaseAuth, fakeFirebaseFirestore, mockFirebaseStorage);
  });

  const String name = 'username';
  const String email = 'user@gmail.com';
  const String password = 'password123';

  group('IsSigned In User', () {
    test('Is signed in successfully', () {
      //arrange
      mockFirebaseAuth.signInAnonymously();

      //act
      final result = authenticationRepositoryImplementation.isSignedIn();

      //assert
      expect(result, true);
    });

    test('Is signed in unsuccessfull', () {
      //act
      final result = authenticationRepositoryImplementation.isSignedIn();

      //assert
      expect(result, false);
    });
  });

  group('Sign In User', () {
    test('Sign in user succcessfull', () async {
      //act
      final result = await authenticationRepositoryImplementation.signInUser(
          username: 'username',
          email: 'useremail@gmail.com',
          password: 'password123');

      //assert
      expect(result, const Right(null));
    });

    test('Sign in user unsucccessfull', () async {
      //arrange
      whenCalling(Invocation.method(#createUserWithEmailAndPassword, null))
          .on(mockFirebaseAuth)
          .thenThrow(Exception());

      //act
      final result = await authenticationRepositoryImplementation.signInUser(
          username: name, email: email, password: password);

      //assert
      expect(result, const Left(SignInFailure('Exception')));
    });
  });

  group('Log in user', () {
    test('Log in user successfull', () async {
      //act
      final result = await authenticationRepositoryImplementation.logInUser(
          email: email, password: password);

      //assert
      expect(result, const Right(null));
    });

    test('Log in user unsuccessfull', () async {
      //arrange
      whenCalling(Invocation.method(#signInWithEmailAndPassword, null, {
        #email: email,
        #password: password
      })).on(mockFirebaseAuth).thenThrow(Exception());

      //act
      final result = await authenticationRepositoryImplementation.logInUser(
          email: email, password: password);

      //assert
      expect(result, const Left(LogInFailure('Exception')));
    });
  });

  group('sign out', () {
    test('Sign out successful', () async {
      //assert
      expect(authenticationRepositoryImplementation.signOut(),
          isA<Future<void>>());
    });
  });
}
