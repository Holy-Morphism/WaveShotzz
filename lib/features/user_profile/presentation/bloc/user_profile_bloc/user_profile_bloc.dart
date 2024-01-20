import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waveshotzz/config/router/router.dart';
import 'package:waveshotzz/config/router/routes.dart';
import 'package:waveshotzz/features/user_profile/domain/usecases/sign_out.dart';

import '../../../domain/usecases/delete_user.dart';
import '../../../domain/usecases/get_user.dart';
import 'user_profile_event.dart';
import 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final SignOut signOut;
  final GetUser getUser;
  final DeleteUser deleteUser;
  UserProfileBloc(this.signOut, this.getUser, this.deleteUser)
      : super(UserProfileInitial()) {
    on<GetUserProfileEvent>((event, emit) async {
      emit(UserProfileLoading());
      await for (var user in getUser()) {
        user.fold((l) => emit(UserProfileError(l.message)),
            (r) => emit(UserProfileLoaded(r)));
      }
    });
    on<DeleteUserProfile>((event, emit) {
      emit(UserProfileLoading());
      deleteUser().then((_) => emit(UserProfileInitial()));
      emit(UserProfileInitial());
    });

    on<SignOutEvent>((event, emit) {
      signOut().then((_) {
        emit(UserProfileInitial());
        router.go(Routes.logInScreen);
      });
    });
  }
}
