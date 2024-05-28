// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {}

class OnChangeSignInEvent extends SignInEvent {
  final String username;
  final String email;
  final String password;
  final String confirmPassword;
  OnChangeSignInEvent({
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  @override
  List<String> get props => [username, email, password, confirmPassword];
}

class OnSubmittedSignInEvent extends SignInEvent {
  final String username;
  final String email;
  final String password;
  final String confirmPassword;
  final Uint8List? image;
  final String? bio;
  OnSubmittedSignInEvent({
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.image,
    required this.bio,
  });

  @override
  List<Object?> get props =>
      [username, email, password, confirmPassword, image, bio];
}
