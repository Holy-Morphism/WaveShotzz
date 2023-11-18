import 'package:dartz/dartz.dart';
import 'package:kylipp/features/authentication/domain/repositories/user_repository.dart';

import '../../../../core/error/failure.dart';
import '../entities/user_entity.dart';

class GetUser {
  final UserRepository _userRepository;
  GetUser(this._userRepository);
  Future<Either<Failure, UserEntity>> call() {
    return _userRepository.getUser();
  }
}
