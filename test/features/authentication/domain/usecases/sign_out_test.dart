import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waveshotzz/features/authentication/domain/usecases/sign_out.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late SignOut signOut;
  late MockAuthenticationRepository mockAuthenticationRepository;
  setUp(() {
    mockAuthenticationRepository = MockAuthenticationRepository();
    signOut = SignOut(mockAuthenticationRepository);
  });

  group('Sign Out test', () {
    test('Sign out succesfull', () async {
      //arrange
      when(mockAuthenticationRepository.signOut())
          .thenAnswer((_) async => const Right(null));

      //assert
      expect(signOut(), isA<Future<void>>());
    });
  });
}
