import 'package:dartz/dartz.dart';
import 'package:kylipp/core/error/failure.dart';
import 'package:kylipp/features/user/domain/repositories/user_repository.dart';

class LikePhoto {
  final UserRepository userRepository;
  LikePhoto(this.userRepository);

  Future<Either<Failure, void>> call(
      {required String uid, required DateTime dateTime}) {
    return userRepository.likePhoto(uid: uid, dateTime: dateTime);
  }
}
