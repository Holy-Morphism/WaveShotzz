import 'package:email_validator/email_validator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/log_in_user.dart';

part 'log_in_event.dart';
part 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  final LogInUser logInUser;
  LogInBloc(this.logInUser) : super(LoginInitial()) {
    on<OnChangedLogInEvent>((event, emit) {
      if (!EmailValidator.validate(event.email)) {
        emit(InValidLogInState(validationError: 'Invalid Email'));
      } else if (event.password.isEmpty) {
        emit(InValidLogInState(validationError: 'Enter Password'));
      } else {
        emit(ValidLogInState());
      }
    });

    on<SubmittedLogInEvent>((event, emit) async {
      emit(LoadingLogInState());
      final result =
          await logInUser(email: event.email, password: event.password);
      result.fold((l) => emit(ErrorLogInState(error: l.message)),
          (r) => emit(SuccessLogInState()));
    });
  }
}
