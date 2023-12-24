import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:waveshotzz/core/error/failure.dart';

import '../repositories/user_repository.dart';

class UploadPost {
  final UserRepository _userRepository;
  UploadPost(this._userRepository);
  Future<Either<Failure, void>> upLoadPost(
      {required Uint8List post, required String caption}) {
    return _userRepository.upLoadPost(post: post, caption: caption);
  }
}
