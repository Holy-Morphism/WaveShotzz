// Mocks generated by Mockito 5.4.4 from annotations
// in waveshotzz/test/features/authentication/helper/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:typed_data' as _i6;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:waveshotzz/core/error/failure.dart' as _i5;
import 'package:waveshotzz/features/authentication/domain/repositories/authentication_repository.dart'
    as _i3;
import 'package:waveshotzz/features/authentication/domain/usecases/log_in_user.dart'
    as _i7;
import 'package:waveshotzz/features/authentication/domain/usecases/sign_in_user.dart'
    as _i8;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AuthenticationRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthenticationRepository extends _i1.Mock
    implements _i3.AuthenticationRepository {
  MockAuthenticationRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, String>> signInUser({
    required String? username,
    required String? email,
    required String? password,
    _i6.Uint8List? image,
    String? bio,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #signInUser,
          [],
          {
            #username: username,
            #email: email,
            #password: password,
            #image: image,
            #bio: bio,
          },
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, String>>.value(
            _FakeEither_0<_i5.Failure, String>(
          this,
          Invocation.method(
            #signInUser,
            [],
            {
              #username: username,
              #email: email,
              #password: password,
              #image: image,
              #bio: bio,
            },
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, String>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> logInUser({
    required String? email,
    required String? password,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #logInUser,
          [],
          {
            #email: email,
            #password: password,
          },
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, void>>.value(
            _FakeEither_0<_i5.Failure, void>(
          this,
          Invocation.method(
            #logInUser,
            [],
            {
              #email: email,
              #password: password,
            },
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, void>>);
}

/// A class which mocks [LogInUser].
///
/// See the documentation for Mockito's code generation for more information.
class MockLogInUser extends _i1.Mock implements _i7.LogInUser {
  MockLogInUser() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> call({
    required String? password,
    required String? email,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {
            #password: password,
            #email: email,
          },
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, void>>.value(
            _FakeEither_0<_i5.Failure, void>(
          this,
          Invocation.method(
            #call,
            [],
            {
              #password: password,
              #email: email,
            },
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, void>>);
}

/// A class which mocks [SignInUser].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignInUser extends _i1.Mock implements _i8.SignInUser {
  MockSignInUser() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, String>> call({
    required String? username,
    required String? email,
    required String? password,
    _i6.Uint8List? image,
    String? bio,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {
            #username: username,
            #email: email,
            #password: password,
            #image: image,
            #bio: bio,
          },
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, String>>.value(
            _FakeEither_0<_i5.Failure, String>(
          this,
          Invocation.method(
            #call,
            [],
            {
              #username: username,
              #email: email,
              #password: password,
              #image: image,
              #bio: bio,
            },
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, String>>);
}
