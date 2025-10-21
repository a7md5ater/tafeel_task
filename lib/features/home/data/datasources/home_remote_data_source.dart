import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tafeel_task/features/home/data/datasources/home_endpoints.dart';
import 'package:tafeel_task/features/home/data/models/get_users_response.dart';

part 'home_remote_data_source.g.dart';

@RestApi()
abstract class HomeRemoteDataSource {
  factory HomeRemoteDataSource(Dio dio) = _HomeRemoteDataSource;

  @GET(HomeEndpoints.getUsers)
  Future<GetUsersResponse> getUsers({@Query('page') required String page});
}
