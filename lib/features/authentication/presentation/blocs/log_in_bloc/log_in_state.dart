part of 'log_in_bloc.dart';

sealed class LogInState extends Equatable {
  @override
  List<String> get props => [];
}

final class LoginInitial extends LogInState {}

final class InValidLogInState extends LogInState {
  final String validationError;
  InValidLogInState({required this.validationError});

  @override
  List<String> get props => [validationError];
}

final class ValidLogInState extends LogInState {}

final class ErrorLogInState extends LogInState {
  final String error;
  ErrorLogInState({required this.error});
  @override
  List<String> get props => [error];
}

final class LoadingLogInState extends LogInState {}

final class SuccessLogInState extends LogInState {}
