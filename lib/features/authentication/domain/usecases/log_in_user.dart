import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../repositories/authentication_repository.dart';

class LogInUser {
  final AuthenticationRepository _authenticationRepository;
  LogInUser(this._authenticationRepository);

  Future<Either<Failure, void>> call({
    required String password,
    required String email,
  }) {
    return _authenticationRepository.logInUser(
        password: password, email: email);
  }
}
