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

class ConnectionFailure extends Failure {
  const ConnectionFailure(super.message);
}

class UserAccountFailure extends Failure {
  const UserAccountFailure(super.message);
}

class WrongPasswordFailure extends Failure {
  const WrongPasswordFailure(super.message);
}

class WeakPasswordFailure extends Failure {
  const WeakPasswordFailure(super.message);
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

class RandomFailure extends Failure {
  const RandomFailure(super.message);
}

class GeneralError extends Failure {
  const GeneralError(super.message);
}
