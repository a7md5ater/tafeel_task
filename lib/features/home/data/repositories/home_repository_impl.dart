import 'package:dartz/dartz.dart';
import 'package:tafeel_task/core/base_repository/base_repository.dart';
import 'package:tafeel_task/core/failures/failure.dart';
import 'package:tafeel_task/core/network/network_info.dart';
import 'package:tafeel_task/features/home/data/datasources/home_remote_data_source.dart';
import 'package:tafeel_task/features/home/data/models/get_users_response.dart';
import 'package:tafeel_task/features/home/domain/repositories/home_repositories.dart';

class HomeRepositoryImpl with BaseRepositoryMixin implements HomeRepository {
  final NetworkInfo _networkInfo;
  final HomeRemoteDataSource _homeRemoteDataSource;

  HomeRepositoryImpl({
    required NetworkInfo networkInfo,
    required HomeRemoteDataSource homeRemoteDataSource,
  }) : _networkInfo = networkInfo,
       _homeRemoteDataSource = homeRemoteDataSource;
  @override
  NetworkInfo get networkInfo => _networkInfo;

  @override
  Future<Either<Failure, GetUsersResponse>> getUsers({
    required String page,
  }) async {
    return handleApiCall<GetUsersResponse>(
      apiCall: () => _homeRemoteDataSource.getUsers(page: page),
    );
  }
}
