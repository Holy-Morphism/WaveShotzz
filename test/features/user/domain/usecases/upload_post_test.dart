import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kylipp/core/error/failure.dart';
import 'package:kylipp/features/user/domain/usecases/upload_post.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late UploadPost uploadPost;
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    uploadPost = UploadPost(mockUserRepository);
  });

  final post = Uint8List.fromList([1, 2, 3]);
  const caption = 'hi';

  const message = 'upload unsuccessful';

  group('Upload post', () {
    test('Upload post successful', () async {
      //arrange
      when(mockUserRepository.upLoadPost(post: post, caption: caption))
          .thenAnswer((_) async => const Right(null));

      //act
      final result = await uploadPost.upLoadPost(post: post, caption: caption);

      //assert
      expect(result, equals(const Right(null)));
    });

    test('Upload post unsuccessful', () async {
      //arrange
      when(mockUserRepository.upLoadPost(post: post, caption: caption))
          .thenAnswer((_) async => const Left(GeneralError(message)));

      //act
      final result = await uploadPost.upLoadPost(post: post, caption: caption);

      //assert
      expect(result, equals(const Left(GeneralError(message))));
    });
  });
}
