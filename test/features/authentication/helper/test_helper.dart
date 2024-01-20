import 'package:waveshotzz/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:waveshotzz/features/authentication/domain/usecases/log_in_user.dart';
import 'package:waveshotzz/features/authentication/domain/usecases/sign_in_user.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  AuthenticationRepository,
  LogInUser,
  SignInUser,
])
void main() {}
