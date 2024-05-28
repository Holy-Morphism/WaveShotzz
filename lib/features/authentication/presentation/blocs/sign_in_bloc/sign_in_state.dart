part of 'sign_in_bloc.dart';

sealed class SignInState extends Equatable {}

final class SignInInitial extends SignInState {
  @override
  List<Object> get props => [];
}

final class InValidSignInState extends SignInState {
  final String validationError;
  InValidSignInState({required this.validationError});
  @override
  List<Object> get props => [validationError];
}

final class ErrorSignInState extends SignInState {
  final String error;
  ErrorSignInState({required this.error});
  @override
  List<Object> get props => [error];
}

final class ValidSignInState extends SignInState {
  @override
  List<Object> get props => [];
}

final class LoadingSignInState extends SignInState {
  @override
  List<Object> get props => [];
}

final class SuccessSignInState extends SignInState {
  @override
  List<Object> get props => [];
}
