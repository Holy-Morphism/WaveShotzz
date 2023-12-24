import 'package:dartz/dartz.dart';
import 'package:waveshotzz/core/error/failure.dart';

import '../repositories/user_repository.dart';

class Unfollow {
  final UserRepository userRepository;
  Unfollow(this.userRepository);

  Future<Either<Failure, void>> call({required String uid}) {
    return userRepository.unfollow(uid: uid);
  }
}
