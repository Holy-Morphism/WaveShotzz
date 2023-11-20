import 'package:dartz/dartz.dart';
import 'package:kylipp/core/error/failure.dart';
import 'package:kylipp/features/user/domain/repositories/user_repository.dart';

class Unfollow {
  final UserRepository userRepository;
  Unfollow(this.userRepository);

  Future<Either<Failure, void>> call({required String uid}) {
    return userRepository.unfollow(uid: uid);
  }
}
