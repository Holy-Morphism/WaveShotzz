import 'package:kylipp/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:kylipp/features/authentication/domain/repositories/user_repository.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  AuthenticationRepository,
  UserRepository,
])
void main() {}
