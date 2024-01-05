import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

abstract class ExploreRepository {
  Future<Either<Failure, List<Map<String, String>>>> getAllUsers();
}
