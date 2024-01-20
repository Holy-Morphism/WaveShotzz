import 'package:waveshotzz/core/usecase/usecase.dart';
import 'package:waveshotzz/features/user_profile/domain/repositories/user_profile_repository.dart';

class SignOut implements Usecase<Future<void>, void> {
  final UserProfileRepository _userProfileRepository;
  SignOut(this._userProfileRepository);

  @override
  Future<void> call({void param}) {
    return _userProfileRepository.signOut();
  }
}
