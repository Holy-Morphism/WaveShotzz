import 'package:equatable/equatable.dart';

class CommentEntity extends Equatable {
  final String uid;
  final String name;
  final String comment;
  final DateTime date;
  const CommentEntity({
    required this.uid,
    required this.name,
    required this.comment,
    required this.date,
  });

  @override
  List<Object> get props => [uid, name, comment, date];
}
