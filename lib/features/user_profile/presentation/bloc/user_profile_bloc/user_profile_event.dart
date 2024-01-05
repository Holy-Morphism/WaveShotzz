import 'package:equatable/equatable.dart';

abstract class UserProfileEvent extends Equatable {}

class GetUserProfileEvent implements UserProfileEvent {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class DeleteUserProfile implements UserProfileEvent {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}
