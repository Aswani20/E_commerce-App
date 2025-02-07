import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Domain/Repositories/Auth/auth_repository_contract.dart';
import 'package:e_commerce_app/Domain/Repositories/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:e_commerce_app/Domain/entities/register_response_entity.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepositoryContract)
class AuthRepositoryImpl implements AuthRepositoryContract {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<RegisterResponseEntity, Failure>> register(String name,
      String email, String password, String rePassword, String phoneNo) async {
    var either = await authRemoteDataSource.register(
        name, email, password, rePassword, phoneNo);

    return either.fold(
      (response) => Left(response),
      (error) => Right(error),
    );
  }
}
