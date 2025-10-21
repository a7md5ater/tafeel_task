import 'package:dartz/dartz.dart';
import 'package:tafeel_task/core/failures/failure.dart';
import 'package:tafeel_task/features/user_details/data/models/get_users_details_response.dart';

abstract class UserDetailsRepository {
  Future<Either<Failure, GetUsersDetailsResponse>> getUserDetails({
    required String id,
  });
}
