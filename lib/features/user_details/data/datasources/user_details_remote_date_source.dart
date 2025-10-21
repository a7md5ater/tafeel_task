import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tafeel_task/features/user_details/data/datasources/user_details_endpoints.dart';
import 'package:tafeel_task/features/user_details/data/models/get_users_details_response.dart';

part 'user_details_remote_date_source.g.dart';

@RestApi()
abstract class UserDetailsRemoteDataSource {
  factory UserDetailsRemoteDataSource(Dio dio) = _UserDetailsRemoteDataSource;

  @GET(UserDetailsEndpoints.getUserDetails)
  Future<GetUsersDetailsResponse> getUserDetails({
    @Path('id') required String id,
  });
}
