import 'package:equatable/equatable.dart';

abstract class UserProfileEvent extends Equatable {}

class GetUserProfileEvent extends UserProfileEvent {
  @override
  List<Object> get props => [];
}

class DeleteUserProfile extends UserProfileEvent {
  @override
  List<Object> get props => [];
}
