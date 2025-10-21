import 'package:dartz/dartz.dart';
import 'package:tafeel_task/core/base_repository/base_repository.dart';
import 'package:tafeel_task/core/failures/failure.dart';
import 'package:tafeel_task/core/network/network_info.dart';
import 'package:tafeel_task/features/user_details/data/datasources/user_details_remote_date_source.dart';
import 'package:tafeel_task/features/user_details/data/models/get_users_details_response.dart';
import 'package:tafeel_task/features/user_details/domain/repositories/user_details_repository.dart';

class UserDetailsRepositoryImpl
    with BaseRepositoryMixin
    implements UserDetailsRepository {
  final NetworkInfo _networkInfo;
  final UserDetailsRemoteDataSource _userDetailsRemoteDataSource;

  UserDetailsRepositoryImpl({
    required NetworkInfo networkInfo,
    required UserDetailsRemoteDataSource userDetailsRemoteDataSource,
  }) : _networkInfo = networkInfo,
       _userDetailsRemoteDataSource = userDetailsRemoteDataSource;
  @override
  NetworkInfo get networkInfo => _networkInfo;

  @override
  Future<Either<Failure, GetUsersDetailsResponse>> getUserDetails({
    required String id,
  }) async {
    return handleApiCall<GetUsersDetailsResponse>(
      apiCall: () => _userDetailsRemoteDataSource.getUserDetails(id: id),
    );
  }
}
