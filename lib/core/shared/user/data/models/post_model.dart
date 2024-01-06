import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:waveshotzz/core/shared/user/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  const PostModel({
    required super.url,
    required super.caption,
    required super.date,
    required super.likes,
    super.isVideo,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      url: json['url'] as String,
      caption: json['caption'] as String,
      date: (json['date'] as Timestamp).toDate(),
      likes: json['likes'] as int,
      isVideo: json['isVideo'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'caption': caption,
      'date': date,
      'likes': likes,
      'isVideo': isVideo,
    };
  }
}
