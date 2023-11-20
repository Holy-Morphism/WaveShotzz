import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kylipp/core/error/failure.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late Unfollow unfollow;
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    unfollow = Unfollow(mockUserRepository);
  });
  const String uid = '123456789';

  const String message = 'Unable to take action';

  group('Follow user test', () {
    test('unFollow user successful', () async {
      //arrange
      when(mockUserRepository.unfollow(uid: uid))
          .thenAnswer((_) async => const Right(null));
      //act
      final result = await unfollow(uid);

      //assert
      expect(result, equals(const Right(null)));
    });

    test('unfollow user unsuccessful', () async {
      //arrange
      when(mockUserRepository.unfollow(uid: uid))
          .thenAnswer((_) async => const Left(GeneralError(message)));
      //act
      final result = await unfollow(uid);

      //assert
      expect(result, equals(const Left(GeneralError(message))));
    });
  });
}
