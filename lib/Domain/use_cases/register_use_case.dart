import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Domain/Repositories/Auth/auth_repository_contract.dart';
import 'package:e_commerce_app/Domain/entities/register_response_entity.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase {
  AuthRepositoryContract authRepositoryContract;

  RegisterUseCase({required this.authRepositoryContract});

  Future<Either<RegisterResponseEntity, Failure>> invoke(String name,
      String email, String password, String rePassword, String phoneNo) {
    return authRepositoryContract.register(
        name, email, password, rePassword, phoneNo);
  }
}
