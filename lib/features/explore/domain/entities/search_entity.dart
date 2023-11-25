// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class SearchEntity extends Equatable {
  final String username;
  final String id;
  final String url;
  const SearchEntity({
    required this.username,
    required this.id,
    required this.url,
  });

  @override
  List<Object> get props => [username, id, url];
}
