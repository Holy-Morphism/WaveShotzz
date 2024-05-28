part of 'log_in_bloc.dart';

sealed class LogInEvent extends Equatable {
  const LogInEvent();

  @override
  List<Object> get props => [];
}

class OnChangedLogInEvent extends LogInEvent {
  final String email, password;
  const OnChangedLogInEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class SubmittedLogInEvent extends LogInEvent {
  final String email, password;
  const SubmittedLogInEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
