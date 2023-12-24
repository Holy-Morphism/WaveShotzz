import 'package:dartz/dartz.dart';
import 'package:waveshotzz/core/error/failure.dart';

import '../repositories/user_repository.dart';

class Follow {
  final UserRepository userRepository;
  Follow(this.userRepository);

  Future<Either<Failure, void>> call({required String uid}) {
    return userRepository.follow(uid: uid);
  }
}
