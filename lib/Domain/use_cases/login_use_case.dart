import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Domain/Repositories/Auth/auth_repository_contract.dart';
import 'package:e_commerce_app/Domain/entities/login_response_entity.dart';
import 'package:e_commerce_app/Domain/entities/register_response_entity.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  AuthRepositoryContract authRepositoryContract;

  LoginUseCase({required this.authRepositoryContract});

  Future<Either<LoginResponseEntity, Failure>> invoke(
      String email, String password) {
    return authRepositoryContract.login(email, password);
  }
}
