// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  final String username;
  final String id;
  final String url;
  final String caption;
  final int likes;
  const PostEntity({
    required this.username,
    required this.id,
    required this.url,
    required this.caption,
    required this.likes ,
  });


  @override
  List<Object> get props => [username,id, url, caption , likes];
}
