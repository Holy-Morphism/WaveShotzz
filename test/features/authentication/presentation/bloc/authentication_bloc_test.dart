import 'dart:typed_data';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waveshotzz/core/error/failure.dart';
import 'package:waveshotzz/features/authentication/presentation/blocs/authentication_bloc.dart';
import 'package:waveshotzz/features/authentication/presentation/blocs/authentication_event.dart';
import 'package:waveshotzz/features/authentication/presentation/blocs/authentication_state.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late MockLogInUser mockLogInUser;
  late MockSignInUser mockSignInUser;
  late AuthenticationBloc authenticationBloc;

  setUp(() {
    mockLogInUser = MockLogInUser();
    mockSignInUser = MockSignInUser();
    authenticationBloc = AuthenticationBloc(mockLogInUser, mockSignInUser);
  });

  const String username = 'adeel';
  const String email = 'adeel@gmail.com';
  const String password = 'password123';
  const String bio = 'hi its me';
  final Uint8List image = Uint8List.fromList([0, 1, 2, 3]);

  group('AuthenticationBloc Testing', () {
    test('Initial State', () {
      expect(authenticationBloc.state, AuthenticationInitial());
    });

    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits [AuthenticationSuccess] when AuthenticationLogIn is added and user is logged in successfully',
      build: () {
        when(mockLogInUser(email: email, password: password))
            .thenAnswer((_) async => const Right(null));
        return authenticationBloc;
      },
      act: (bloc) =>
          bloc.add(const AuthenticationLogIn(password: password, email: email)),
      expect: () => <AuthenticationState>[
        const AuthenticationLoading(),
        const AuthenticationSuccess(),
      ],
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits [AuthenticationFailed] when AuthenticationLogIn is added and user is not logged in successfully',
      build: () {
        when(mockLogInUser(email: email, password: password)).thenAnswer(
            (_) async => const Left(LogInFailure('log in failure')));
        return authenticationBloc;
      },
      act: (bloc) =>
          bloc.add(const AuthenticationLogIn(password: password, email: email)),
      expect: () => <AuthenticationState>[
        const AuthenticationLoading(),
        const AuthenticationFailed('log in failure'),
      ],
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits [AuthenticationSuccess] when AuthenticationSignIn is added and user is Signed in successfully',
      build: () {
        when(mockSignInUser(
                username: username,
                email: email,
                password: password,
                bio: bio,
                image: image))
            .thenAnswer((_) async => const Right(username));
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(AuthenticationSignIn(
          username: username,
          email: email,
          password: password,
          bio: bio,
          image: image)),
      expect: () => <AuthenticationState>[
        const AuthenticationLoading(),
        const AuthenticationSuccess(),
      ],
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits [AuthenticationSuccess] when AuthenticationSignIn is added and user is Signed in successfully',
      build: () {
        when(mockSignInUser(
                username: username,
                email: email,
                password: password,
                bio: bio,
                image: image))
            .thenAnswer((_) async => const Left(SignInFailure('failed')));
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(AuthenticationSignIn(
          username: username,
          email: email,
          password: password,
          bio: bio,
          image: image)),
      expect: () => <AuthenticationState>[
        const AuthenticationLoading(),
        const AuthenticationFailed('failed'),
      ],
    );
  });
}
