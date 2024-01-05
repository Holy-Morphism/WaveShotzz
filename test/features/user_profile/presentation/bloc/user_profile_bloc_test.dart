import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:waveshotzz/core/error/failure.dart';
import 'package:waveshotzz/features/user_profile/domain/entities/user_profile_entity.dart';

void main() {
  late MockGetUser mockGetUser;
  late MockDeleteUser mockDeleteUser;

  late UserProfileBloc userProfileBloc;

  setUp(() {
    userProfileBloc = UserProfileBloc(mockGetUser, mockDeleteUser);
  });

  const UserProfileEntity user = UserProfileEntity(
      name: 'name', email: 'email', profilePicture: 'photoUrl', posts: []);

  group('User profile bloc testing', () {
    test('Initial State', () {
      expect(userProfileBloc.state, UserProfileInitial());
    });
  });

  blocTest<UserProfileBloc, UserProfileState>(
    'emits [UserProfileLoading,UserProfileLoaded] when UserProfileGetData is added and user is returned',
    build: () {
      when(mockGetUser()).thenAnswer((_) async => const Right(user));
      return UserProfileBloc;
    },
    act: (bloc) => bloc.add(const UserProfileGetData()),
    expect: () => <UserProfileState>[
      const UserProfileLoading(),
      const UserProfileLoaded()
    ],
  );

  blocTest<UserProfileBloc, UserProfileState>(
    'emits [UserProfileLoading,UserProfileFailed] when UserProfileGetData is added and user is returned',
    build: () {
      when(mockGetUser())
          .thenAnswer((_) async => const Left(GetUserFailure('error')));
      return UserProfileBloc;
    },
    act: (bloc) => bloc.add(const UserProfileGetData()),
    expect: () => <UserProfileState>[
      const UserProfileLoading(),
      const UserProfileFailed('error')
    ],
  );
}
