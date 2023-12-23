import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:waveshotzz/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:waveshotzz/features/authentication/presentation/bloc/authentication_event.dart';
import 'package:waveshotzz/features/authentication/presentation/bloc/authentication_state.dart';
import 'package:waveshotzz/features/authentication/presentation/screens/log_in_screen.dart';
import 'package:waveshotzz/features/authentication/presentation/screens/sign_in_screen.dart';

class MockAuthenticationBloc
    extends MockBloc<AuthenticationEvent, AuthenticationState>
    implements AuthenticationBloc {}

void main() {
  late MockAuthenticationBloc mockAuthenticationBloc;

  setUp(() {
    mockAuthenticationBloc = MockAuthenticationBloc();
  });

  Widget makeTestableWidget(Widget child) {
    return BlocProvider<AuthenticationBloc>(
      create: (context) => mockAuthenticationBloc,
      child: MaterialApp(
        home: child,
      ),
    );
  }

  testWidgets('log in screen textfield test', (widgetTester) async {
    //arrange
    when(() => mockAuthenticationBloc.state)
        .thenReturn(const AuthenticationUnauthenticated());

    //act
    await widgetTester.pumpWidget(makeTestableWidget(const LogInScreen()));
    final textfield = find.byType(TextField);
    expect(textfield, findsNWidgets(2));

    await widgetTester.enterText(textfield.at(0), 'email');
    await widgetTester.enterText(textfield.at(1), 'password');

    await widgetTester.pump();

    //assert
    expect(find.text('email'), findsOneWidget);
    expect(find.text('password'), findsOneWidget);
  });

  testWidgets('Log in screen button test', (widgetTester) async {
    //arrange
    when(() => mockAuthenticationBloc.state)
        .thenReturn(const AuthenticationUnauthenticated());

    //act
    await widgetTester.pumpWidget(makeTestableWidget(const SignInScreen()));
    final textfield = find.byType(OutlinedButton);
    expect(textfield, findsOneWidget);

    await widgetTester.pump();

    //assert
    expect(find.text('Login'), findsOneWidget);
  });

  testWidgets('Switch page text', (widgetTester) async {
    //arrange
    when(() => mockAuthenticationBloc.state)
        .thenReturn(const AuthenticationUnauthenticated());

    //act
    await widgetTester.pumpWidget(makeTestableWidget(const LogInScreen()));

    //assert
    expect(find.text('Don\'t have an account?'), findsOneWidget);
  });

  testWidgets('Switch page TextButton', (widgetTester) async {
    //arrange
    when(() => mockAuthenticationBloc.state)
        .thenReturn(const AuthenticationUnauthenticated());

    //act
    await widgetTester.pumpWidget(makeTestableWidget(const LogInScreen()));
    final textButton = find.byType(TextButton);
    expect(textButton, findsOneWidget);

    await widgetTester.pump();

    //assert
    expect(find.text('Sign Up'), findsOneWidget);
  });
}
