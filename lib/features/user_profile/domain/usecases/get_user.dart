import 'package:dartz/dartz.dart';
import 'package:waveshotzz/features/user_profile/domain/repositories/user_repository.dart';

import '../../../../core/error/failure.dart';
import '../entities/user_profile_entity.dart';

class GetUser {
  final UserProfileRepository _userProfileRepository;
  GetUser(this._userProfileRepository);
  Stream<Either<Failure, UserProfileEntity>> call() {
    return _userProfileRepository.getUser();
  }
}
