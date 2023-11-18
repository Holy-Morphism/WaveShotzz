import 'package:kylipp/features/authentication/domain/repositories/authentication_repository.dart';

class IsSignedIn {
  final AuthenticationRepository _authenticationRepository;
  IsSignedIn(this._authenticationRepository);
  bool call() {
    return _authenticationRepository.isSignedIn();
  }
}
