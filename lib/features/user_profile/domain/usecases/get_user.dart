import 'package:dartz/dartz.dart';
import 'package:waveshotzz/features/user_profile/domain/repositories/user_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/shared/user/domain/entities/user_entity.dart';

class GetUser {
  final UserProfileRepository _userProfileRepository;
  GetUser(this._userProfileRepository);
  Future<Either<Failure, UserEntity>> call() {
    return _userProfileRepository.getUser();
  }
}
