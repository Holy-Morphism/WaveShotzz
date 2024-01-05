import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/delete_user.dart';
import '../../../domain/usecases/get_user.dart';
import 'user_profile_event.dart';
import 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final GetUser getUser;
  final DeleteUser deleteUser;
  UserProfileBloc(this.getUser, this.deleteUser) : super(UserProfileInitial()) {
    on<GetUserProfileEvent>((event, emit) {
      emit(UserProfileLoading());
      getUser().listen((event) {
        event.fold((l) => emit(UserProfileError(l.message)),
            (r) => emit(UserProfileLoaded(r)));
      });
    });
    on<DeleteUserProfile>((event, emit) {
      emit(UserProfileLoading());
      deleteUser().then((_) => emit(UserProfileInitial()));
      emit(UserProfileInitial());
    });
  }
}
