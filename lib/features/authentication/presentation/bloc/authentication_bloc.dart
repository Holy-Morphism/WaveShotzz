import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/is_signed_in.dart';
import '../../domain/usecases/log_in_user.dart';
import '../../domain/usecases/sign_in_user.dart';
import '../../domain/usecases/sign_out.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final IsSignedIn isSignedIn;
  final LogInUser logInUser;
  final SignInUser signInUser;
  final SignOut signOut;
  AuthenticationBloc(
      this.isSignedIn, this.logInUser, this.signInUser, this.signOut)
      : super(AuthenticationInitial()) {
    on<AuthenticationStart>((event, emit) {
      if (isSignedIn()) {
        emit(AuthenticationSuccess());
      } else {
        emit(AuthenticationUnauthenticated());
      }
    });

    on<AuthenticationLogIn>((event, emit) async {
      emit(AuthenticationLoading());
      final result =
          await logInUser(email: event.email, password: event.password);
      result.fold((l) => emit(AuthenticationFailed(l.message)),
          (r) => emit(AuthenticationSuccess()));
      emit(AuthenticationUnauthenticated());
    });

    on<AuthenticationSignIn>((event, emit) async {
      emit(AuthenticationLoading());
      final result = await signInUser(
          email: event.email,
          username: event.username,
          password: event.password,
          bio: event.bio,
          image: event.image);
      result.fold((l) => emit(AuthenticationFailed(l.message)),
          (r) => emit(AuthenticationSuccess()));
      emit(AuthenticationUnauthenticated());
    });

    on<AuthenticationSignOut>((event, emit) async {
      final result = await signOut();
      result.fold((l) => AuthenticationFailed(l.message),
          (r) => emit(AuthenticationUnauthenticated()));
    });
  }
}
