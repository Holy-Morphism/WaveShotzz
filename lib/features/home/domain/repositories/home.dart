import 'package:dartz/dartz.dart';
import 'package:waveshotzz/features/home/domain/entities/story_entity.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/shared/user/domain/entities/post_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<PostEntity>>> getFollowersPosts();
  Future<Either<Failure, List<StoryEntity>>> getFollowerStory();
}
