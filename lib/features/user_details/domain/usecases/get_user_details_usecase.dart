import 'package:dartz/dartz.dart';
import 'package:tafeel_task/core/failures/failure.dart';
import 'package:tafeel_task/features/user_details/domain/entities/user_entity.dart';
import 'package:tafeel_task/features/user_details/domain/repositories/user_details_repository.dart';

class GetUserDetailsUsecase {
  final UserDetailsRepository _userDetailsRepository;

  GetUserDetailsUsecase({required UserDetailsRepository userDetailsRepository})
    : _userDetailsRepository = userDetailsRepository;

  Future<Either<Failure, UserEntity>> call({required String id}) async {
    final response = await _userDetailsRepository.getUserDetails(id: id);

    return response.fold((failure) => Left(failure), (result) {
      if (result.data == null) {
        return Left(RuntimeFailure(error: Exception('Something went wrong')));
      }
      return Right(result.data!.toEntity());
    });
  }
}
