import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kylipp/core/error/failure.dart';
import 'package:kylipp/features/authentication/domain/usecases/sign_out.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late SignOut signOut;
  late MockAuthenticationRepository mockAuthenticationRepository;
  setUp(() {
    mockAuthenticationRepository = MockAuthenticationRepository();
    signOut = SignOut(mockAuthenticationRepository);
  });

  const message = 'Sign out error';

  group('Sign Out test', () {
    test('Sign out succesfull', () async {
      //arrange
      when(mockAuthenticationRepository.signOut())
          .thenAnswer((_) async => const Right(null));

      //act
      final result = await signOut();

      //assert
      expect(result, const Right(null));
    });

    test('Sign out unsuccesfull', () async {
      //arrange
      when(mockAuthenticationRepository.signOut())
          .thenAnswer((_) async => const Left(SignOutFailure(message)));

      //act
      final result = await signOut();

      //assert
      expect(result, const Left(SignOutFailure(message)));
    });
  });
}
