import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waveshotzz/core/error/failure.dart';
import 'package:waveshotzz/features/authentication/domain/usecases/log_in_user.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late LogInUser logInUser;
  late MockAuthenticationRepository mockAuthenticationRepository;
  setUp(() {
    mockAuthenticationRepository = MockAuthenticationRepository();
    logInUser = LogInUser(mockAuthenticationRepository);
  });

  const String email = 'user@gmail.com';
  const String password = 'password123';

  const message = 'Login error';

  group('Log In User', () {
    test('Log In user succesful', () async {
      //arrange
      when(mockAuthenticationRepository.logInUser(
              email: email, password: password))
          .thenAnswer((_) async => const Right(null));

      //act
      final result = await logInUser(email: email, password: password);

      //assert
      expect(result, const Right(null));
    });

    test('Log In unsuccessful', () async {
      //arrange
      when(mockAuthenticationRepository.logInUser(
              email: email, password: password))
          .thenAnswer((_) async => const Left(LogInFailure(message)));

      //act
      final result = await logInUser(email: email, password: password);

      //assert
      expect(result, const Left(LogInFailure(message)));
    });
  });
}
