import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../repositories/user_repository.dart';

class DeleteUser {
  final UserProfileRepository _userProfileRepository;
  DeleteUser(this._userProfileRepository);
  Future<Either<Failure, void>> call() {
    return _userProfileRepository.deleteUser();
  }
}
