import 'package:waveshotzz/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:waveshotzz/features/authentication/domain/usecases/is_signed_in.dart';
import 'package:waveshotzz/features/authentication/domain/usecases/log_in_user.dart';
import 'package:waveshotzz/features/authentication/domain/usecases/sign_in_user.dart';
import 'package:waveshotzz/features/authentication/domain/usecases/sign_out.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  AuthenticationRepository,
  IsSignedIn,
  LogInUser,
  SignInUser,
  SignOut,
])
void main() {}
