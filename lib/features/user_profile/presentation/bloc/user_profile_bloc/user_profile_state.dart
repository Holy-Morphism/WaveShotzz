import 'package:equatable/equatable.dart';
import 'package:waveshotzz/features/user_profile/domain/entities/user_profile_entity.dart';

abstract class UserProfileState extends Equatable {}

class UserProfileInitial implements UserProfileState {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class UserProfileLoading implements UserProfileState {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class UserProfileLoaded implements UserProfileState {
  final UserProfileEntity user;
  UserProfileLoaded(this.user);
  @override
  List<Object> get props => [user];

  @override
  bool get stringify => true;
}

class UserProfileError implements UserProfileState {
  final String message;
  UserProfileError(this.message);
  @override
  List<Object> get props => [message];

  @override
  bool get stringify => true;
}
