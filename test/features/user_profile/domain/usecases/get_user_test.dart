import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waveshotzz/core/error/failure.dart';
import 'package:waveshotzz/features/user_profile/domain/entities/user_profile_entity.dart';
import 'package:waveshotzz/features/user_profile/domain/usecases/get_user.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late GetUser getUser;
  late MockUserProfileRepository mockUserProfileRepository;

  setUp(() {
    mockUserProfileRepository = MockUserProfileRepository();
    getUser = GetUser(mockUserProfileRepository);
  });

  const user = UserProfileEntity(
    name: 'user',
    profilePictureUrl: 'profilePictureUrl',
    posts: [],
  );

  const message = 'Unable to get user data';

  group('Get User data', () {
    test('Get user data successful', () async {
      //arrange
      when(mockUserProfileRepository.getUser()).thenAnswer((_) async* {
        yield const Right(user);
      });

      //act
      final result = getUser();

      //assert
      await expectLater(result, emitsInOrder([const Right(user)]));
    });

    test('Get user data unsuccessful', () async {
      //arrange
      when(mockUserProfileRepository.getUser()).thenAnswer((_) async* {
        yield const Left(RandomFailure(message));
      });

      //act
      final result = getUser();

      //assert
      await expectLater(
          result, emitsInOrder([const Left(RandomFailure(message))]));
    });
  });
}
