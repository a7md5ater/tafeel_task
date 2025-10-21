import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'package:tafeel_task/core/network/network_info.dart';

import 'package:tafeel_task/core/network/dio/dio_factory.dart';
import 'package:tafeel_task/features/home/cubit/home_cubit.dart';
import 'package:tafeel_task/features/home/data/datasources/home_remote_data_source.dart';
import 'package:tafeel_task/features/home/data/repositories/home_repository_impl.dart';
import 'package:tafeel_task/features/home/domain/repositories/home_repositories.dart';
import 'package:tafeel_task/features/home/domain/usecases/get_users_usecase.dart';
import 'package:tafeel_task/features/user_details/cubit/user_details_cubit.dart';
import 'package:tafeel_task/features/user_details/data/datasources/user_details_remote_date_source.dart';
import 'package:tafeel_task/features/user_details/data/repositories/user_details_repository_impl.dart';
import 'package:tafeel_task/features/user_details/domain/repositories/user_details_repository.dart';
import 'package:tafeel_task/features/user_details/domain/usecases/get_user_details_usecase.dart';

final di = GetIt.instance;

void setupGetIt() async {
  /// NETWORK INFO
  di.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(connectionChecker: di()),
  );
  di.registerLazySingleton<InternetConnection>(() => InternetConnection());

  /// DIO
  di.registerLazySingleton<Dio>(() => DioFactory.getDio());

  /// HOME
  // CUBIT
  di.registerFactory<HomeCubit>(() => HomeCubit(getUsersUsecase: di()));

  // DATA SOURCES
  di.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSource(di()),
  );

  // REPOSITORY
  di.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(networkInfo: di(), homeRemoteDataSource: di()),
  );

  // USECASES
  di.registerLazySingleton<GetUsersUsecase>(
    () => GetUsersUsecase(homeRepository: di()),
  );

  /// USER DETAILS
  // CUBIT
  di.registerFactory<UserDetailsCubit>(
    () => UserDetailsCubit(getUserDetailsUsecase: di()),
  );

  // DATA SOURCES
  di.registerLazySingleton<UserDetailsRemoteDataSource>(
    () => UserDetailsRemoteDataSource(di()),
  );

  // REPOSITORY
  di.registerLazySingleton<UserDetailsRepository>(
    () => UserDetailsRepositoryImpl(
      networkInfo: di(),
      userDetailsRemoteDataSource: di(),
    ),
  );

  // USECASES
  di.registerLazySingleton<GetUserDetailsUsecase>(
    () => GetUserDetailsUsecase(userDetailsRepository: di()),
  );
}
