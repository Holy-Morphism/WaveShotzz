import 'package:dartz/dartz.dart';
import 'package:kylipp/core/error/failure.dart';
import 'package:kylipp/core/usecase/usecase.dart';
import 'package:kylipp/features/authentication/domain/repositories/authentication_repository.dart';

class SignOut implements Usecase<Future<Either<Failure, void>>, void> {
  final AuthenticationRepository _authenticationRepository;
  SignOut(this._authenticationRepository);

  @override
  Future<Either<Failure, void>> call({void param}) {
    return _authenticationRepository.signOut();
  }
}
