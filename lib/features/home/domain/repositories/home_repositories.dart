import 'package:dartz/dartz.dart';
import 'package:tafeel_task/core/failures/failure.dart';
import 'package:tafeel_task/features/home/data/models/get_users_response.dart';

abstract class HomeRepository {
  Future<Either<Failure, GetUsersResponse>> getUsers({required String page});
}
