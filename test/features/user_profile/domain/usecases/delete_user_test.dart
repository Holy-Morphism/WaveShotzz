import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waveshotzz/core/error/failure.dart';

import 'package:mockito/mockito.dart';
import 'package:waveshotzz/features/user_profile/domain/usecases/delete_user.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late DeleteUser deleteUser;
  late MockUserProfileRepository mockUserProfileRepository;

  setUp(() {
    mockUserProfileRepository = MockUserProfileRepository();
    deleteUser = DeleteUser(mockUserProfileRepository);
  });

  group('delte User', () {
    test('Get user successful', () async {
      //arrange
      when(mockUserProfileRepository.deleteUser())
          .thenAnswer((_) async => const Right(null));

      //act
      final result = await deleteUser();

      //asset
      expect(result, equals(const Right(null)));
    });

    test('delete user unsuccessful', () async {
      //arrange
      when(mockUserProfileRepository.deleteUser())
          .thenAnswer((_) async => left(const GetUserFailure('message')));

      //act
      final result = deleteUser();

      //asset
      expect(result, equals(const Left(GetUserFailure('message'))));
    });
  });
}
