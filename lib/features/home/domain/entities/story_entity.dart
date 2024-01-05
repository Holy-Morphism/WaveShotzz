import 'package:equatable/equatable.dart';

class StoryEntity extends Equatable {
  final String url;
  final DateTime date;
  final bool isVideo;

  const StoryEntity(
      {required this.url, required this.date, required this.isVideo});

  @override
  List<Object> get props => [url, date, isVideo];
}
