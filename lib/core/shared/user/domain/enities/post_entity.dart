import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  final String url;
  final String caption;
  final DateTime date;
  final int likes;
  final bool isVideo;
  const PostEntity({
    required this.url,
    required this.caption,
    required this.date,
    required this.likes,
    this.isVideo = false,
  });

  @override
  List<Object> get props => [url, caption, date, likes, isVideo];
}
