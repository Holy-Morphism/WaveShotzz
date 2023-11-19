// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(
    this.message,
  );

  @override
  List<Object> get props => [message];

  @override
  bool get stringify => true;
}

class LogInFailure extends Failure {
  const LogInFailure(super.message);
}

class SignInFailure extends Failure {
  const SignInFailure(super.message);
}

class SignOutFailure extends Failure {
  const SignOutFailure(super.message);
}

class GetUserFailure extends Failure {
  const GetUserFailure(super.message);
}

class GeneralError extends Failure {
  const GeneralError(super.message);
}
