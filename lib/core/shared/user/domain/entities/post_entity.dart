import 'package:equatable/equatable.dart';
import 'package:waveshotzz/core/shared/user/domain/entities/comment_entity.dart';

class PostEntity extends Equatable {
  final String url;
  final String caption;
  final DateTime date;
  final int likes;
  final List<CommentEntity> comments;
  final bool isVideo;
  const PostEntity({
    required this.url,
    required this.caption,
    required this.date,
    required this.likes,
    this.isVideo = false,
    required this.comments,
  });

  @override
  List<Object> get props => [url, caption, date, likes, comments, isVideo];
}
