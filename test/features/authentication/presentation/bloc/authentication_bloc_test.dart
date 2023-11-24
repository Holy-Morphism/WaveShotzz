import 'package:flutter_test/flutter_test.dart';
import 'package:kylipp/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:kylipp/features/authentication/presentation/bloc/authentication_state.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late MockIsSignedIn mockIsSignedIn;
  late MockLogInUser mockLogInUser;
  late MockSignInUser mockSignInUser;
  late MockSignOut mockSignOut;
  late AuthenticationBloc authenticationBloc;

  setUp(() {
    mockLogInUser = MockLogInUser();
    mockSignInUser = MockSignInUser();
    mockSignOut = MockSignOut();
    mockIsSignedIn = MockIsSignedIn();
    authenticationBloc = AuthenticationBloc(
        mockIsSignedIn, mockLogInUser, mockSignInUser, mockSignOut);
  });

  test('Initial State', () {
    expect(authenticationBloc.state, AuthenticationInitial());
  });
}
