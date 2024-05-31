import 'dart:typed_data';

import 'package:email_validator/email_validator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/sign_in_user.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

List<Map<String, dynamic>> rules = [
  {
    'regex': RegExp(r'.{8,}'),
    'error': 'Password must be at least 8 characters long.'
  },
  {
    'regex': RegExp(r'(.*[0-9].*){3,}'),
    'error': 'Password must contain at least 3 numbers.'
  },
  {
    'regex': RegExp(r'.*[A-Z].*'),
    'error': 'Password must contain at least 1 uppercase letter.'
  },
  {
    'regex': RegExp(r'.*[a-z].*'),
    'error': 'Password must contain at least 1 lowercase letter.'
  },
  {
    'regex': RegExp(r'.*[\W_].*'),
    'error': 'Password must contain at least 1 special character.'
  },
];

String isPasswordValid(String password) {
  for (var rule in rules) {
    if (!rule['regex'].hasMatch(password)) {
      return rule['error'];
    }
  }
  return '';
}

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUser signInUser;
  SignInBloc(this.signInUser) : super(SignInInitial()) {
    on<OnChangeSignInEvent>((event, emit) {
      if (event.username.isEmpty ||
          event.email.isEmpty ||
          event.password.isEmpty ||
          event.confirmPassword.isEmpty) {
        emit(InValidSignInState(validationError: 'All fields are required'));
      } else if (event.username.length < 3) {
        emit(InValidSignInState(
            validationError: 'Username must be aleast 3 characters'));
      } else if (!EmailValidator.validate(event.email)) {
        emit(InValidSignInState(validationError: 'Invalid Email'));
      } else if (event.password != event.confirmPassword) {
        emit(InValidSignInState(validationError: 'Passwords do not match'));
      } else if (isPasswordValid(event.password) != '') {
        emit(InValidSignInState(
            validationError: isPasswordValid(event.password)));
      } else {
        emit(ValidSignInState());
      }
    });

    on<OnSubmittedSignInEvent>((event, emit) async {
      emit(LoadingSignInState());
      final result = await signInUser(
          email: event.email,
          username: event.username,
          password: event.password,
          bio: event.bio,
          image: event.image);
      result.fold((l) => emit(ErrorSignInState(error: l.message)),
          (r) => emit(SuccessSignInState()));
    });
  }
}
