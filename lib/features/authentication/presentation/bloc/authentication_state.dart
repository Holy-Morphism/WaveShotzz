// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationFailed extends AuthenticationState {
  final String error;
  AuthenticationFailed(this.error);

  @override
  List<Object> get props => [error];
}

class AuthenticationSuccess extends AuthenticationState {
  // final String name;
  // AuthenticationSuccess(this.name);

  // @override
  // List<Object> get props => [name];
}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationUnauthenticated extends AuthenticationState {}
