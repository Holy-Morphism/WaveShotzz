import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waveshotzz/core/error/failure.dart';
import 'package:waveshotzz/core/shared/user/domain/usecases/like_photo.dart';
import 'package:mockito/mockito.dart';

import '../../../helper/test_helper.mocks.dart';

void main() {
  late LikePhoto likePhoto;
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    likePhoto = LikePhoto(mockUserRepository);
  });

  const String uid = '123456789';
  final DateTime dateTime = DateTime.now();
  const String message = 'Unable to take action';

  group('Follow user test', () {
    test('unFollow user successful', () async {
      //arrange
      when(mockUserRepository.likePhoto(uid: uid))
          .thenAnswer((_) async => const Right(null));
      //act
      final result = await likePhoto(uid: uid, dateTime: dateTime);

      //assert
      expect(result, equals(const Right(null)));
    });

    test('unfollow user unsuccessful', () async {
      //arrange
      when(mockUserRepository.likePhoto(uid: uid))
          .thenAnswer((_) async => const Left(GeneralError(message)));
      //act
      final result = await likePhoto(uid: uid, dateTime: dateTime);

      //assert
      expect(result, equals(const Left(GeneralError(message))));
    });
  });
}
