import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waveshotzz/core/error/failure.dart';
import 'package:waveshotzz/core/shared/user/domain/entities/user_entity.dart';
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

  const user = UserEntity(
      uid: '123456789',
      username: 'user',
      email: 'user@gmail.com',
      password: 'password123');

  const message = 'Unable to get user data';

  group('Get User data', () {
    test('Get user data successful', () async {
      //arrange
      when(mockUserProfileRepository.getUser())
          .thenAnswer((_) async => const Right(user));

      //act
      final result = await getUser();

      //asset
      expect(result, equals(const Right(user)));
    });

    test('Get user data unsuccessful', () async {
      //arrange
      when(mockUserProfileRepository.getUser())
          .thenAnswer((_) async => left(const GetUserFailure(message)));

      //act
      final result = await getUser();

      //asset
      expect(result, equals(const Left(GetUserFailure(message))));
    });
  });
}
