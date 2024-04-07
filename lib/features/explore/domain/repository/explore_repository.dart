import 'package:dartz/dartz.dart';
import 'package:waveshotzz/core/shared/user/domain/entities/comment_entity.dart';
import 'package:waveshotzz/features/explore/domain/entities/post_entity.dart';

import '../../../../core/error/failure.dart';

abstract class ExploreRepository {
  Future<Either<Failure, List<PostEntity>>> getExplorePosts();
  Future<Either<Failure,void>> likePost({required String postId});
  Future<Either<Failure,void>> unlikePost({required String postId});
  Future<Either<Failure,List<CommentEntity>>> getCommentsOnPost({required String postId});
  Future<Either<Failure,void>> commentOnPost({required String postId,required String comment});
  Stream<Either<Failure,List>> getUserSearchResults();
  
}
