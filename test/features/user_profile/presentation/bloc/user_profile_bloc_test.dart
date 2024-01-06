import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:waveshotzz/core/error/failure.dart';
import 'package:waveshotzz/features/user_profile/domain/entities/user_profile_entity.dart';
import 'package:waveshotzz/features/user_profile/presentation/bloc/user_profile_bloc/user_profile_bloc.dart';
import 'package:waveshotzz/features/user_profile/presentation/bloc/user_profile_bloc/user_profile_event.dart';
import 'package:waveshotzz/features/user_profile/presentation/bloc/user_profile_bloc/user_profile_state.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late MockGetUser mockGetUser;
  late MockDeleteUser mockDeleteUser;
  late UserProfileBloc userProfileBloc;

  setUp(() {
    mockGetUser = MockGetUser();
    mockDeleteUser = MockDeleteUser();
    userProfileBloc = UserProfileBloc(mockGetUser, mockDeleteUser);
  });

  const UserProfileEntity user = UserProfileEntity(
    name: 'user',
    profilePictureUrl: 'profilePictureUrl',
    posts: [],
  );

  group('User profile bloc testing', () {
    test('Initial State', () {
      expect(userProfileBloc.state, UserProfileInitial());
    });
  });

  blocTest<UserProfileBloc, UserProfileState>(
    'emits [UserProfileLoading,UserProfileLoaded] when UserProfileGetData is added and user is returned',
    build: () {
      when(mockGetUser()).thenAnswer((_) async* {
        yield const Right(user);
      });
      return UserProfileBloc(mockGetUser, mockDeleteUser);
    },
    act: (bloc) => bloc.add(GetUserProfileEvent()),
    expect: () => <UserProfileState>[
      UserProfileLoading(),
      UserProfileLoaded(user),
    ],
  );

  blocTest<UserProfileBloc, UserProfileState>(
    'emits [UserProfileLoading,UserProfileFailed] when UserProfileGetData is added and user is returned',
    build: () {
      when(mockGetUser()).thenAnswer((_) async* {
        yield left(const GetUserFailure('error'));
      });
      return UserProfileBloc(mockGetUser, mockDeleteUser);
    },
    act: (bloc) => bloc.add(GetUserProfileEvent()),
    expect: () =>
        <UserProfileState>[UserProfileLoading(), UserProfileError('error')],
  );
}
