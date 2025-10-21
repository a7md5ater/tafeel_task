import 'package:dartz/dartz.dart';
import 'package:tafeel_task/core/failures/failure.dart';
import 'package:tafeel_task/features/home/domain/entities/home_entity.dart';
import 'package:tafeel_task/features/home/domain/repositories/home_repositories.dart';

class GetUsersUsecase {
  final HomeRepository _homeRepository;

  GetUsersUsecase({required HomeRepository homeRepository})
    : _homeRepository = homeRepository;

  Future<Either<Failure, HomeEntity>> call({required String page}) async {
    final response = await _homeRepository.getUsers(page: page);
    return response.fold(
      (failure) => Left(failure),
      (result) => Right(result.toEntity()),
    );
  }
}
