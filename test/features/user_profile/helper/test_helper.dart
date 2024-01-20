import 'package:mockito/annotations.dart';
import 'package:waveshotzz/features/user_profile/domain/repositories/user_profile_repository.dart';
import 'package:waveshotzz/features/user_profile/domain/usecases/delete_user.dart';
import 'package:waveshotzz/features/user_profile/domain/usecases/get_user.dart';
import 'package:waveshotzz/features/user_profile/domain/usecases/sign_out.dart';

@GenerateMocks([
  UserProfileRepository,
  GetUser,
  DeleteUser,
  SignOut,
])
void main() {}
