import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/log_in_user.dart';
import '../../domain/usecases/sign_in_user.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LogInUser logInUser;
  final SignInUser signInUser;
  AuthenticationBloc(this.logInUser, this.signInUser)
      : super(AuthenticationInitial()) {
    on<AuthenticationLogIn>((event, emit) async {
      emit(const AuthenticationLoading());
      final result =
          await logInUser(email: event.email, password: event.password);
      result.fold((l) => emit(AuthenticationFailed(l.message)),
          (r) => emit(const AuthenticationSuccess()));
    });

    on<AuthenticationSignIn>((event, emit) async {
      emit(const AuthenticationLoading());
      final result = await signInUser(
          email: event.email,
          username: event.username,
          password: event.password,
          bio: event.bio,
          image: event.image);
      result.fold((l) => emit(AuthenticationFailed(l.message)),
          (r) => emit(const AuthenticationSuccess()));
    });
  }
}
