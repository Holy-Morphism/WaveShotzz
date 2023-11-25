import 'package:mockito/annotations.dart';
import 'package:waveshotzz/features/explore/domain/repository/explore_repository.dart';


@GenerateMocks([
  ExploreRepository,
  GetExplorePosts,
  GetCommentsOnPost,
])
void main() {}
