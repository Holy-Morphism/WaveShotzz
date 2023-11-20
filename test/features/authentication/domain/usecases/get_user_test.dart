import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kylipp/core/error/failure.dart';
import 'package:kylipp/core/shared/entities/user_entity.dart';
import 'package:kylipp/features/user/domain/usecases/get_user.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late GetUser getUser;
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    getUser = GetUser(mockUserRepository);
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
      when(mockUserRepository.getUser()).thenAnswer((_) async => right(user));

      //act
      final result = await getUser();

      //asset
      expect(result, equals(const Right(user)));
    });

    test('Get user data unsuccessful', () async {
      //arrange
      when(mockUserRepository.getUser())
          .thenAnswer((_) async => left(const GetUserFailure(message)));

      //act
      final result = await getUser();

      //asset
      expect(result, equals(const Left(GetUserFailure(message))));
    });
  });
}
