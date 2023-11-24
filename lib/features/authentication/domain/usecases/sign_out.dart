import 'package:kylipp/core/usecase/usecase.dart';
import 'package:kylipp/features/authentication/domain/repositories/authentication_repository.dart';

class SignOut implements Usecase<Future<void>, void> {
  final AuthenticationRepository _authenticationRepository;
  SignOut(this._authenticationRepository);

  @override
  Future<void> call({void param}) {
    return _authenticationRepository.signOut();
  }
}
