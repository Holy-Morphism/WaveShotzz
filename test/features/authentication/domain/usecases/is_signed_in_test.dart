import 'package:flutter_test/flutter_test.dart';
import 'package:kylipp/features/authentication/domain/usecases/is_signed_in.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late IsSignedIn isSignedIn;
  late MockAuthenticationRepository mockAuthenticationRepository;

  setUp(() {
    mockAuthenticationRepository = MockAuthenticationRepository();
    isSignedIn = IsSignedIn(mockAuthenticationRepository);
  });

  group('Is Signed In', () {
    test('Is Signed in', () {
      //arrange
      when(mockAuthenticationRepository.isSignedIn()).thenAnswer((_) => true);

      //act
      final result = isSignedIn();

      //assert
      expect(result, true);
    });

    test('Is Not Signed in', () {
      //arrange
      when(mockAuthenticationRepository.isSignedIn()).thenAnswer((_) => false);

      //act
      final result = isSignedIn();

      //assert
      expect(result, false);
    });
  });
}
