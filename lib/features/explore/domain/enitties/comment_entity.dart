// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CommentEntity extends Equatable {
final String username;
final String comment;
final String id;
  const CommentEntity({
    required this.username,
    required this.comment,
    required this.id,
  });

  

  @override
  List<Object> get props => [username, comment, id];
}
