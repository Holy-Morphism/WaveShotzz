import 'package:waveshotzz/core/shared/user/domain/entities/comment_entity.dart';

class CommentModel extends CommentEntity {
  const CommentModel(
      {required super.uid,
      required super.name,
      required super.comment,
      required super.date});

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      uid: json['uid'] as String,
      name: json['name'] as String,
      comment: json['comment'] as String,
      date: json['date'] as DateTime,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'comment': comment,
      'date': date,
    };
  }
}
