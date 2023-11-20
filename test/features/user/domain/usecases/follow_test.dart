import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kylipp/core/error/failure.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late Follow follow;
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    follow = Follow(mockUserRepository);
  });
  const String uid = '123456789';

  const String message = 'Unable to take action';

  group('Follow user test', () {
    test('Follow user successful', () async {
      //arrange
      when(mockUserRepository.follow(uid: uid))
          .thenAnswer((_) async => const Right(null));
      //act
      final result = await follow(uid);

      //assert
      expect(result, equals(const Right(null)));
    });

    test('Follow user unsuccessful', () async {
      //arrange
      when(mockUserRepository.follow(uid: uid))
          .thenAnswer((_) async => const Left(GeneralError(message)));
      //act
      final result = await follow(uid);

      //assert
      expect(result, equals(const Left(GeneralError(message))));
    });
  });
}
